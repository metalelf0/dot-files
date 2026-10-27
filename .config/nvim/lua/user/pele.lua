-- Pele emits themeable SVG that uses CSS custom properties in presentation
-- attributes (e.g. fill="var(--_fg)"). Neither ImageMagick, rsvg-convert nor
-- resvg resolve var() in presentation attributes, so rasterization would be
-- blank. Inline the root-level custom properties before rasterizing.
local function resolve_svg_vars(svg)
	local vars = {}
	local style = svg:match('<svg[^>]-style="([^"]*)"') or ""
	for name, value in style:gmatch("%-%-([%w_%-]+)%s*:%s*([^;]+)") do
		vars[name] = vim.trim(value)
	end

	local function resolve(value, depth)
		depth = depth or 0
		if depth > 10 then
			return value
		end
		return (value:gsub("var%(%s*%-%-([%w_%-]+)%s*,?%s*([^()]*)%)", function(name, fallback)
			if vars[name] then
				return resolve(vars[name], depth + 1)
			end
			if fallback ~= "" then
				return vim.trim(fallback)
			end
			return "var(--" .. name .. ")"
		end))
	end

	for name, value in pairs(vars) do
		vars[name] = resolve(value, 0)
	end
	return resolve(svg, 0)
end

-- Locate the ```mermaid fenced block containing the cursor line.
-- Returns { start_idx, end_idx, text } or nil.
local function mermaid_block(bufnr, cursor_line)
	local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
	local start_idx, end_idx

	for i = cursor_line, 1, -1 do
		if lines[i]:match("^```mermaid") then
			start_idx = i
			break
		end
	end

	for i = cursor_line, #lines do
		if lines[i]:match("^```$") and start_idx then
			end_idx = i
			break
		end
	end

	if not start_idx or not end_idx then
		return nil
	end

	local content = vim.api.nvim_buf_get_lines(bufnr, start_idx, end_idx - 1, false)
	return { start_idx = start_idx, end_idx = end_idx, text = table.concat(content, "\n") }
end

-- Per-block output path: <dir>/assets/<basename>-<hash>.png, where <hash> is a
-- short digest of the diagram source so multiple blocks in one file stay
-- distinct. Returns (absolute_path, relative_markdown_path).
local function diagram_png_path(bufnr, mmd)
	local file = vim.api.nvim_buf_get_name(bufnr)
	local dir, base
	if file == "" then
		dir = vim.fn.stdpath("run")
		base = "unnamed"
	else
		dir = vim.fn.fnamemodify(file, ":p:h")
		base = vim.fn.fnamemodify(file, ":t:r")
	end

	local assets = dir .. "/assets"
	vim.fn.mkdir(assets, "p")
	local name = string.format("%s-%s.png", base, vim.fn.sha256(mmd):sub(1, 8))
	return assets .. "/" .. name, "./assets/" .. name
end

-- Compile the Mermaid block under the cursor with Pele and link the PNG.
local function compile_mermaid_block_with_pele()
	local bufnr = vim.api.nvim_get_current_buf()
	local cursor_line = vim.api.nvim_win_get_cursor(0)[1]
	local block = mermaid_block(bufnr, cursor_line)

	if not block then
		vim.notify("Cursor is not inside a valid ```mermaid code block.", vim.log.levels.WARN)
		return
	end

	local target_png, relative_png = diagram_png_path(bufnr, block.text)

	-- Execute Pele synchronously via standard systems piping
	local svg = vim.fn.system("~/.local/bin/pele-compile", block.text)
	if vim.v.shell_error ~= 0 then
		vim.notify("Pele compilation failed: " .. svg, vim.log.levels.ERROR)
		return
	end

	-- Rasterize SVG -> PNG. Pele SVG relies on CSS custom properties, so inline
	-- them first (see resolve_svg_vars), then use rsvg-convert (librsvg) reading
	-- the SVG from stdin.
	local resolved = resolve_svg_vars(svg)
	local raster = vim.fn.system({ "rsvg-convert", "--zoom", "2", "-o", target_png, "-" }, resolved)
	if vim.v.shell_error ~= 0 then
		vim.notify("SVG rasterization failed: " .. raster, vim.log.levels.ERROR)
		return
	end

	-- Inject the image link below the closing fence unless one already exists.
	local next_line = vim.api.nvim_buf_get_lines(bufnr, block.end_idx, block.end_idx + 1, false)[1] or ""
	if not next_line:find("!%[Mermaid Diagram%]") then
		vim.api.nvim_buf_set_lines(bufnr, block.end_idx, block.end_idx, false, { "", "![Mermaid Diagram](" .. relative_png .. ")" })
	end

	-- Force a buffer write to trigger the snacks.image preview refresh
	vim.cmd("write")
	vim.notify("Pele diagram refreshed inside terminal overlay!", vim.log.levels.INFO)
end

-- Open the diagram PNG for the block under the cursor in a full-window tab.
-- snacks.image takes over *.png buffers and auto-resizes to the window, so grow
-- the window/terminal to zoom. `bufhidden = wipe` discards the buffer (and its
-- kitty placement) when you leave the tab, avoiding a stale zoomed overlay.
local function zoom_mermaid_diagram()
	local bufnr = vim.api.nvim_get_current_buf()
	local cursor_line = vim.api.nvim_win_get_cursor(0)[1]
	local block = mermaid_block(bufnr, cursor_line)

	if not block then
		vim.notify("Cursor is not inside a valid ```mermaid code block.", vim.log.levels.WARN)
		return
	end

	local target_png = diagram_png_path(bufnr, block.text)
	if vim.fn.filereadable(target_png) == 0 then
		vim.notify("No Pele diagram yet — run <leader>mp first.", vim.log.levels.WARN)
		return
	end

	vim.cmd("tabedit " .. vim.fn.fnameescape(target_png))
	vim.bo.bufhidden = "wipe"
end

vim.keymap.set({ "n", "v" }, "<leader>mp", compile_mermaid_block_with_pele, { desc = "Preview Mermaid with Pele" })
vim.keymap.set({ "n", "v" }, "<leader>mz", zoom_mermaid_diagram, { desc = "Zoom Mermaid diagram (Pele)" })
