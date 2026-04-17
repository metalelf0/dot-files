local M = {}

M.rootdir = function()
	local root_dir
	for dir in vim.fs.parents(vim.api.nvim_buf_get_name(0)) do
		if vim.fn.isdirectory(dir .. "/.git") == 1 then
			root_dir = dir
			break
		end
	end

	if root_dir then
		return vim.fs.basename(root_dir)
	else
		return ""
	end
end

M.nvim_config_base_path = function()
	return "~/.config/nvim"
end

M.merge_tables = function(first_table, second_table)
	for k, v in pairs(second_table) do
		first_table[k] = v
	end
end

M.contains = function(tab, val)
	for index, value in ipairs(tab) do
		if value == val then
			return true
		end
	end

	return false
end

function M.warn(msg, name)
	vim.notify(msg, vim.log.levels.WARN, { title = name or "init.lua" })
end

function M.error(msg, name)
	vim.notify(msg, vim.log.levels.ERROR, { title = name or "init.lua" })
end

function M.info(msg, name)
	vim.notify(msg, vim.log.levels.INFO, { title = name or "init.lua" })
end

function M.insert_text_at_cursor(text)
	local pos = vim.api.nvim_win_get_cursor(0)[2]
	local line = vim.api.nvim_get_current_line()
	local nline = line:sub(0, pos) .. text .. line:sub(pos + 1)
	vim.api.nvim_set_current_line(nline)
end

M.read_file = function(file_name)
	local file = io.open(file_name, "r")
	if file then
		local lines = {}
		for line in file:lines() do
			table.insert(lines, line)
		end
		file:close()
		return lines
	else
		print("Failed to open the file for reading:", file_name)
	end
end

M.write_file = function(file_name, lines)
	local file = io.open(file_name, "w")
	if file then
		file:write(table.concat(lines, "\n"))
		file:close()
	else
		print("Failed to open the file for writing:", file_name)
	end
end

M.toggle_indent_lines = function()
	local snacks = require("snacks")
	if snacks.indent.enabled then
		snacks.indent.disable()
	else
		snacks.indent.enable()
	end
end

M.copy_relpath_with_line = function()
	local buf = 0
	local file = vim.api.nvim_buf_get_name(buf)
	if file == nil or file == "" then
		vim.notify("No file name for current buffer", vim.log.levels.WARN)
		return
	end

	-- Try to find project root via .git; fall back to current working directory
	local function project_root()
		local dir = vim.fn.fnamemodify(file, ":p:h")
		local git_dir = vim.fn.finddir(".git", dir .. ";")
		if git_dir ~= "" then
			return vim.fn.fnamemodify(git_dir, ":h")
		end
		return vim.loop.cwd() or vim.fn.getcwd()
	end

	local function abs(path)
		return vim.fn.fnamemodify(path, ":p")
	end

	local root = abs(project_root())
	if root:sub(-1) ~= "/" then
		root = root .. "/"
	end
	local file_abs = abs(file)
	local rel
	if file_abs:sub(1, #root) == root then
		rel = file_abs:sub(#root + 1)
	else
		-- If the file isn't under root, at least make it relative to CWD if possible
		rel = vim.fn.fnamemodify(file, ":.")
	end

	local line = vim.api.nvim_win_get_cursor(0)[1]
	local out = string.format("%s:%d", rel, line)

	-- Write to system clipboard register (+). Also try (*) for X11 selection.
	vim.fn.setreg("+", out)
	pcall(vim.fn.setreg, "*", out)

	vim.notify("Copied: " .. out, vim.log.levels.INFO)
end

return M
