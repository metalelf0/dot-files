local M = {}

-- marks a task line as done. This:
-- - updates the checkbox from [ ] or [/] to [x]
-- - adds a done marker with current date at the end of the line (e.g. " ✅ 2026-03-11")
M.mark_task_done = function()
	local date = os.date("%Y-%m-%d")
	local line_number = vim.fn.line(".")
	local line = vim.fn.getline(line_number)

	if line:match("%- %[ %] #task") then
		local new_line = line:gsub("%- %[ %] #task", "- [x] #task") .. " ✅ " .. date
		vim.fn.setline(line_number, new_line)
	elseif line:match("%- %[/%] #task") then
		local new_line = line:gsub("%- %[/%] #task", "- [x] #task") .. " ✅ " .. date
		vim.fn.setline(line_number, new_line)
	else
		print("No task to mark as done on this line.")
	end
end

-- marks a task line as in progress. This:
-- - updates the checkbox from [ ] or [x] to [/]
-- - adds an "in progress" marker with current date at the end of the line (e.g. " 🛫 2026-03-11")
M.mark_task_in_progress = function()
	local date = os.date("%Y-%m-%d")
	local line_number = vim.fn.line(".")
	local line = vim.fn.getline(line_number)

	if line:match("%- %[ %] #task") then
		local new_line = line:gsub("%- %[ %] #task", "- [/] #task") .. " 🛫 " .. date
		vim.fn.setline(line_number, new_line)
	elseif line:match("%- %[x%] #task") then
		local new_line = line:gsub("%- %[x%] #task", "- [/] #task") .. " 🛫 " .. date
		vim.fn.setline(line_number, new_line)
	else
		print("No task to mark as in progress on this line.")
	end
end

-- marks a task line as todo. This:
-- - updates the checkbox from [x] or [/] to [ ]
M.mark_task_todo = function()
	local date = os.date("%Y-%m-%d")
	local line_number = vim.fn.line(".")
	local line = vim.fn.getline(line_number)

	if line:match("%- %[x%] #task") then
		local new_line = line:gsub("%- %[x%] #task", "- [ ] #task")
		vim.fn.setline(line_number, new_line)
	elseif line:match("%- %[/%] #task") then
		local new_line = line:gsub("%- %[/%] #task", "- [ ] #task")
		vim.fn.setline(line_number, new_line)
	else
		print("No task to mark as todo on this line.")
	end
end

-- edits a date on a task line. This:
-- - asks the user to select a date type (Done ✅, Planned 📅, Started 🛫, Canceled ❌)
-- - asks for a date in YYYY-MM-DD format, pre-populated with the existing value or today
-- - replaces the date if already present, or appends it to the end of the line
M.edit_task_date = function()
	local line_number = vim.fn.line(".")
	local line = vim.fn.getline(line_number)

	if not line:match("^%- %[.%] #task") then
		print("No task on this line.")
		return
	end

	local date_types = {
		{ label = "Done", symbol = "✅" },
		{ label = "Planned", symbol = "📅" },
		{ label = "Started", symbol = "🛫" },
		{ label = "Canceled", symbol = "❌" },
		{ label = "Added", symbol = "➕" },
	}

	vim.ui.select(date_types, {
		prompt = "Select date type:",
		format_item = function(item)
			return item.symbol .. " " .. item.label
		end,
	}, function(choice)
		if not choice then
			return
		end

		local existing_date = line:match(choice.symbol .. " (%d%d%d%d%-%d%d%-%d%d)")
		local default_date = existing_date or os.date("%Y-%m-%d")

		vim.ui.input({
			prompt = choice.symbol .. " " .. choice.label .. " date (YYYY-MM-DD): ",
			default = default_date,
		}, function(date)
			if not date or date == "" then
				return
			end

			if not date:match("^%d%d%d%d%-%d%d%-%d%d$") then
				print("Invalid date format. Use YYYY-MM-DD.")
				return
			end

			local new_line
			if line:match(choice.symbol .. " %d%d%d%d%-%d%d%-%d%d") then
				new_line = line:gsub(choice.symbol .. " %d%d%d%d%-%d%d%-%d%d", choice.symbol .. " " .. date)
			else
				new_line = line .. " " .. choice.symbol .. " " .. date
			end

			vim.fn.setline(line_number, new_line)
		end)
	end)
end

-- writes the new task line to tasks.md and refreshes any open buffer for it.
local function write_task(description, planned)
	local config = require("user.config")
	local today = os.date("%Y-%m-%d")

	local line = "- [ ] #task " .. description
	if planned and planned ~= "" then
		line = line .. " 📅 " .. planned
	end
	line = line .. " ➕ " .. today

	local path = config.obsidian_workspace_path .. "/tasks.md"
	local lines = {}
	if vim.fn.filereadable(path) == 1 then
		lines = vim.fn.readfile(path)
	end
	table.insert(lines, line)

	local ok, err = pcall(vim.fn.writefile, lines, path)
	if not ok then
		vim.notify("Failed to write task: " .. tostring(err), vim.log.levels.ERROR)
		return
	end

	print("Task added to " .. path)

	local bufnr = vim.fn.bufnr(path)
	if bufnr ~= -1 and vim.api.nvim_buf_is_loaded(bufnr) then
		vim.api.nvim_buf_call(bufnr, function()
			vim.cmd("checktime")
		end)
	end
end

-- creates a new task. This:
-- - opens a single outer floating window ("New task") that contains two nested sub-windows:
--     1. a 3-line description editor with its own border, near the top
--     2. a calendar date picker with its own border, below the description
--   visually it looks like one dialog with two boxed sections inside.
-- - <Tab> / <CR> from the description focuses the calendar; <Tab> from the calendar
--   returns focus to the description.
-- - <CR> on the calendar writes the task; "." clears the planned date; <Esc>/q cancels.
-- - <Esc> in the description also cancels the whole picker.
-- - description is required (cancels if empty).
-- - appends a new task line to the end of tasks.md in the configured obsidian workspace.
-- - reloads the tasks.md buffer if it is already open.
M.create_task = function()
	local has_snacks, Snacks = pcall(require, "snacks")
	if not has_snacks or not Snacks.win then
		vim.notify("snacks.nvim is required for create_task.", vim.log.levels.ERROR)
		return
	end

	local calendar = require("user.ui.calendar")

	-- ── geometry ──────────────────────────────────────────────────────────
	-- all measurements are in editor cells. a rounded-border floating window with
	-- content size (W, H) occupies (W + 2, H + 2) cells on screen.
	--
	-- inside the outer window, child sub-windows are positioned with `relative = "win"`,
	-- so their (row, col) offsets are 0-indexed cells within the OUTER window's *content*
	-- area (i.e. excluding the outer border).
	--
	-- vertical layout inside the outer content area:
	--   row 0           : empty padding
	--   rows 1..3       : description content (3 rows, height=3)
	--   <description border occupies rows 0 and 4 around its content>
	--   row 5           : empty padding/separator
	--   rows 6..(6+ch-1): calendar content (ch rows depending on month, 7..9)
	--   <calendar border occupies rows 5 and (5+ch+1) around its content>
	--   row 5+ch+2      : empty padding
	-- so outer height = 5 + ch + 2 + 1 = 8 + ch. we use a safe upper bound (10) so the
	-- outer window doesn't resize as the user navigates between months.
	local CAL_WIDTH = calendar.WIDTH
	local DESC_HEIGHT = 3
	local CAL_MAX_HEIGHT = 10

	-- outer width: aim for 120 content cells; clamp to fit terminal; never narrower than
	-- the calendar (with its border + 2 cells of horizontal padding around it).
	local MIN_OUTER_W = CAL_WIDTH + 2 + 2 -- calendar border (2) + 1 cell padding each side
	local OUTER_W = math.max(MIN_OUTER_W, math.min(120, vim.o.columns - 4))
	-- outer height: top padding (1) + desc box (DESC_HEIGHT + 2) + gap (1) + cal box (CAL_MAX_HEIGHT + 2) + bottom padding (1).
	local OUTER_H = 1 + (DESC_HEIGHT + 2) + 1 + (CAL_MAX_HEIGHT + 2) + 1

	-- description sub-window content width. with 1 cell of padding inside the outer's
	-- content area, the child's left border sits at outer col 1 and its right border at
	-- col 1 + DESC_W + 1. to fit, we need 1 + (DESC_W + 2) + 1 <= OUTER_W, hence:
	local DESC_W = OUTER_W - 4

	-- description position inside outer's content area (relative coordinates).
	local DESC_REL_ROW = 1
	local DESC_REL_COL = 1

	-- calendar position inside outer's content area, horizontally centred.
	local CAL_REL_ROW = DESC_REL_ROW + DESC_HEIGHT + 2 + 1 -- desc top + desc content + desc border + 1-cell gap
	local CAL_REL_COL = math.floor((OUTER_W - (CAL_WIDTH + 2)) / 2)

	-- outer window position on the editor (centre it).
	local outer_row = math.max(0, math.floor((vim.o.lines - (OUTER_H + 2)) / 2))
	local outer_col = math.max(0, math.floor((vim.o.columns - (OUTER_W + 2)) / 2))

	-- ── shared state ──────────────────────────────────────────────────────
	local description = ""
	local cancelled = false
	-- `closing` short-circuits the close-cascade: when one sub-window closes, it triggers
	-- the others, but we don't want those to recursively trigger the first one again.
	local closing = false

	-- ── outer window: a non-interactive frame around the dialog ───────────
	local outer_buf = vim.api.nvim_create_buf(false, true)
	-- fill the outer buffer with blank padding lines so it has the right visual size.
	local outer_padding = {}
	for _ = 1, OUTER_H do
		outer_padding[#outer_padding + 1] = ""
	end
	vim.api.nvim_buf_set_lines(outer_buf, 0, -1, false, outer_padding)

	local outer_win = Snacks.win({
		buf = outer_buf,
		relative = "editor",
		position = "float",
		row = outer_row,
		col = outer_col,
		width = OUTER_W,
		height = OUTER_H,
		border = "rounded",
		title = " New task ",
		title_pos = "center",
		footer = " <Tab> switch  <CR> ok  <Esc> cancel ",
		footer_pos = "center",
		style = "minimal",
		wo = {
			cursorline = false,
			number = false,
			relativenumber = false,
			signcolumn = "no",
			wrap = false,
			winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
		},
		bo = {
			bufhidden = "wipe",
			buftype = "nofile",
			modifiable = false,
			swapfile = false,
		},
	})

	-- ── description sub-window ────────────────────────────────────────────
	local desc_buf = vim.api.nvim_create_buf(false, true)
	local hint_ns = vim.api.nvim_create_namespace("user_create_task_hint")

	-- pre-populate with empty lines so the editor starts with the full 3-row height.
	vim.api.nvim_buf_set_lines(desc_buf, 0, -1, false, { "", "", "" })

	local function read_description()
		local lines = vim.api.nvim_buf_get_lines(desc_buf, 0, -1, false)
		-- join non-empty lines with spaces, trimming each. "buy milk\n  \nfix bug" -> "buy milk fix bug".
		local parts = {}
		for _, l in ipairs(lines) do
			local trimmed = vim.trim(l)
			if trimmed ~= "" then
				parts[#parts + 1] = trimmed
			end
		end
		return table.concat(parts, " ")
	end

	local function refresh_hint()
		vim.api.nvim_buf_clear_namespace(desc_buf, hint_ns, 0, -1)
		local lines = vim.api.nvim_buf_get_lines(desc_buf, 0, -1, false)
		local is_empty = true
		for _, l in ipairs(lines) do
			if l ~= "" then
				is_empty = false
				break
			end
		end
		if is_empty then
			vim.api.nvim_buf_set_extmark(desc_buf, hint_ns, 0, 0, {
				virt_text = { { "Task description...", "Comment" } },
				virt_text_pos = "overlay",
			})
		end
	end

	refresh_hint()

	local desc_win = Snacks.win({
		buf = desc_buf,
		relative = "win",
		win = outer_win.win,
		position = "float",
		row = DESC_REL_ROW,
		col = DESC_REL_COL,
		width = DESC_W,
		height = DESC_HEIGHT,
		border = "rounded",
		title = " Description ",
		title_pos = "left",
		style = "minimal",
		wo = {
			cursorline = false,
			number = false,
			relativenumber = false,
			signcolumn = "no",
			wrap = true,
			linebreak = true,
		},
		bo = {
			bufhidden = "wipe",
			buftype = "nofile",
			modifiable = true,
			swapfile = false,
		},
	})

	-- ── helpers used by both panes ────────────────────────────────────────
	local cal_win_handle, cal_buf_handle -- assigned after calendar.pick opens.

	local function close_outer()
		if outer_win and outer_win.close and outer_win.win and vim.api.nvim_win_is_valid(outer_win.win) then
			outer_win:close()
		end
	end

	local function close_desc()
		if desc_win and desc_win.close and desc_win.win and vim.api.nvim_win_is_valid(desc_win.win) then
			desc_win:close()
		end
	end

	local function close_calendar()
		-- closing the calendar buffer triggers its BufWipeout, which fires the calendar's on_select.
		if cal_buf_handle and vim.api.nvim_buf_is_valid(cal_buf_handle) then
			vim.api.nvim_buf_delete(cal_buf_handle, { force = true })
		end
	end

	local function focus_description()
		if desc_win and desc_win.win and vim.api.nvim_win_is_valid(desc_win.win) then
			vim.api.nvim_set_current_win(desc_win.win)
			-- cursor at the end of the last non-empty line; enter insert.
			local lines = vim.api.nvim_buf_get_lines(desc_buf, 0, -1, false)
			local target_row = 1
			for i = #lines, 1, -1 do
				if lines[i] ~= "" then
					target_row = i
					break
				end
			end
			vim.api.nvim_win_set_cursor(desc_win.win, { target_row, #lines[target_row] })
			vim.cmd("startinsert!")
		end
	end

	local function focus_calendar()
		if cal_win_handle and vim.api.nvim_win_is_valid(cal_win_handle) then
			if vim.fn.mode():match("^[iR]") then
				vim.cmd("stopinsert")
			end
			vim.api.nvim_set_current_win(cal_win_handle)
		end
	end

	-- ── description keymaps ───────────────────────────────────────────────
	local desc_map = { buffer = desc_buf, nowait = true, silent = true }
	vim.keymap.set({ "i", "n" }, "<Tab>", function()
		description = read_description()
		focus_calendar()
	end, desc_map)
	vim.keymap.set({ "i", "n" }, "<CR>", function()
		description = read_description()
		focus_calendar()
	end, desc_map)
	vim.keymap.set({ "i", "n" }, "<Esc>", function()
		cancelled = true
		if vim.fn.mode():match("^[iR]") then
			vim.cmd("stopinsert")
		end
		close_desc()
	end, desc_map)
	vim.keymap.set("n", "q", function()
		cancelled = true
		close_desc()
	end, desc_map)

	-- keep the placeholder hint in sync as the user types.
	vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
		buffer = desc_buf,
		callback = refresh_hint,
	})

	-- when the description sub-window goes away, tear down the calendar and the outer frame.
	vim.api.nvim_create_autocmd("BufWipeout", {
		buffer = desc_buf,
		once = true,
		callback = function()
			if closing then
				return
			end
			closing = true
			close_calendar()
			close_outer()
		end,
	})

	-- ── calendar sub-window ───────────────────────────────────────────────
	-- calendar.pick fires on_select exactly once on any closure. that's where we decide
	-- whether to write the task.
	calendar.pick({
		title = " 📅 Planned date ",
		date = os.date("%Y-%m-%d"),
		relative = "win",
		win = outer_win.win,
		row = CAL_REL_ROW,
		col = CAL_REL_COL,
		on_select = function(planned, outcome)
			-- the calendar's buffer is wiping right now. close the rest.
			closing = true
			close_desc()
			close_outer()

			if cancelled or outcome == "cancelled" then
				vim.notify("Task creation cancelled.", vim.log.levels.WARN)
				return
			end

			-- `description` is updated whenever focus leaves the description (<Tab>/<CR>);
			-- if the user jumped straight to the calendar without editing, fall back to
			-- whatever's currently in the description buffer (might already be wiped, in
			-- which case we use the cached value).
			local desc_text = description
			if desc_text == "" and vim.api.nvim_buf_is_valid(desc_buf) then
				desc_text = read_description()
			end
			local desc_trimmed = vim.trim(desc_text)
			if desc_trimmed == "" then
				vim.notify("Task creation cancelled: empty description.", vim.log.levels.WARN)
				return
			end

			-- "selected" -> planned is "YYYY-MM-DD"; "cleared" -> planned is nil.
			write_task(desc_trimmed, planned)
		end,
	})

	-- capture the calendar's window/buffer handles (calendar.pick leaves its window as
	-- the current window after returning).
	cal_win_handle = vim.api.nvim_get_current_win()
	cal_buf_handle = vim.api.nvim_get_current_buf()

	-- add a <Tab> binding on the calendar buffer so the user can return to the description.
	vim.keymap.set("n", "<Tab>", function()
		focus_description()
	end, { buffer = cal_buf_handle, nowait = true, silent = true })

	-- start in the description so the user can type immediately.
	focus_description()
end

return M
