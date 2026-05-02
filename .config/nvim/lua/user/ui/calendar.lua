-- a small floating calendar date picker rendered in a Snacks window.
--
-- usage:
--   require("user.ui.calendar").pick({
--     date = "2026-05-01",          -- optional, YYYY-MM-DD; defaults to today
--     title = " Pick a date ",
--     row = 10, col = 20,           -- optional explicit float position; centred by default
--     relative = "win", win = winid, -- optional: position relative to a parent window
--     on_select = function(date) ... end, -- date is "YYYY-MM-DD" or nil if cancelled
--   })
--
-- exported constants:
--   M.WIDTH         visual width of the rendered grid in columns (21)
--
-- keymaps inside the calendar:
--   h/l         previous / next day
--   j/k         next / previous week
--   b/w        previous / next month (also <C-b>/<C-f>)
--   B/W        previous / next year
--   t           jump to today
--   .           clear date (return nil)
--   <CR>        select highlighted day
--   q / <Esc>   cancel

local M = {}

local WEEKDAYS = { "Mo", "Tu", "We", "Th", "Fr", "Sa", "Su" }
local MONTHS = {
	"January",
	"February",
	"March",
	"April",
	"May",
	"June",
	"July",
	"August",
	"September",
	"October",
	"November",
	"December",
}

-- parses YYYY-MM-DD into a table {year, month, day} or nil
local function parse_date(str)
	if type(str) ~= "string" then
		return nil
	end
	local y, m, d = str:match("^(%d%d%d%d)%-(%d%d)%-(%d%d)$")
	if not y then
		return nil
	end
	return { year = tonumber(y), month = tonumber(m), day = tonumber(d) }
end

local function today()
	local t = os.date("*t")
	return { year = t.year, month = t.month, day = t.day }
end

local function format_date(d)
	return string.format("%04d-%02d-%02d", d.year, d.month, d.day)
end

-- returns the number of days in a given (year, month).
local function days_in_month(year, month)
	-- normalise month into 1..12
	while month > 12 do
		month = month - 12
		year = year + 1
	end
	while month < 1 do
		month = month + 12
		year = year - 1
	end
	local t = os.time({ year = year, month = month + 1, day = 0, hour = 12 })
	return tonumber(os.date("%d", t))
end

-- returns the day-of-week (1 = Monday, 7 = Sunday) for the 1st of (year, month).
local function first_weekday(year, month)
	local t = os.time({ year = year, month = month, day = 1, hour = 12 })
	-- os.date("%w") -> 0 (Sun) .. 6 (Sat); convert to 1 (Mon) .. 7 (Sun)
	local wday = tonumber(os.date("%w", t))
	if wday == 0 then
		return 7
	end
	return wday
end

-- shifts a date by `days` days, normalising into a valid date.
local function add_days(d, days)
	local t = os.time({ year = d.year, month = d.month, day = d.day, hour = 12 })
	t = t + days * 86400
	local out = os.date("*t", t)
	return { year = out.year, month = out.month, day = out.day }
end

-- shifts a date by `n` months, clamping the day to the end of the resulting month.
local function add_months(d, n)
	local year = d.year
	local month = d.month + n
	while month > 12 do
		month = month - 12
		year = year + 1
	end
	while month < 1 do
		month = month + 12
		year = year - 1
	end
	local day = math.min(d.day, days_in_month(year, month))
	return { year = year, month = month, day = day }
end

local function dates_equal(a, b)
	return a and b and a.year == b.year and a.month == b.month and a.day == b.day
end

-- the visual width (in cells) of the rendered calendar grid: 7 weekdays * 3 cols.
M.WIDTH = 21

-- builds the lines + a lookup map of {row, col_start, col_end} per day for a given (year, month).
-- returns:
--   lines: array of strings to display
--   day_pos: { [day] = { row, col_start, col_end } } (1-indexed buffer row)
local function render_month(year, month)
	local lines = {}
	local day_pos = {}

	-- header: " <  May 2026  > "
	local header = string.format(" %s %d ", MONTHS[month], year)
	-- centre the header to fit roughly 21 cols (3 chars per weekday * 7 = 21)
	local total_width = 21
	local pad = math.max(0, math.floor((total_width - #header) / 2))
	lines[#lines + 1] = string.rep(" ", pad) .. header

	-- weekday row
	lines[#lines + 1] = table.concat(WEEKDAYS, " ")

	local first_wd = first_weekday(year, month)
	local total_days = days_in_month(year, month)

	local current_row = #lines + 1
	local cells = {}
	-- pad leading empty cells
	for _ = 1, first_wd - 1 do
		cells[#cells + 1] = "  "
	end
	for day = 1, total_days do
		cells[#cells + 1] = string.format("%2d", day)
	end
	-- pad trailing cells to complete the last week
	while #cells % 7 ~= 0 do
		cells[#cells + 1] = "  "
	end

	-- emit week rows + record column positions for each day
	for week_start = 1, #cells, 7 do
		local row_cells = {}
		for i = 0, 6 do
			row_cells[#row_cells + 1] = cells[week_start + i]
		end
		local line = table.concat(row_cells, " ")
		lines[#lines + 1] = line

		local row = current_row
		current_row = current_row + 1

		-- compute column positions; each cell is 2 chars wide, separated by 1 space
		for i = 0, 6 do
			local cell = cells[week_start + i]
			local trimmed = cell:gsub("^%s+", "")
			if trimmed ~= "" then
				local day = tonumber(trimmed)
				if day then
					local col_start = i * 3 -- 0-indexed byte column where the cell starts
					day_pos[day] = { row = row, col_start = col_start, col_end = col_start + 2 }
				end
			end
		end
	end

	return lines, day_pos
end

-- highlights the selected day on the buffer using extmarks.
local function apply_highlight(buf, ns, day_pos, selected_day, today_day, current_is_today_month)
	vim.api.nvim_buf_clear_namespace(buf, ns, 0, -1)

	if current_is_today_month and today_day and day_pos[today_day] then
		local pos = day_pos[today_day]
		vim.api.nvim_buf_set_extmark(buf, ns, pos.row - 1, pos.col_start, {
			end_col = pos.col_end,
			hl_group = "Special",
		})
	end

	if selected_day and day_pos[selected_day] then
		local pos = day_pos[selected_day]
		vim.api.nvim_buf_set_extmark(buf, ns, pos.row - 1, pos.col_start, {
			end_col = pos.col_end,
			hl_group = "Visual",
		})
	end
end

-- opens a calendar picker.
-- `opts.on_select` is called with one of:
--   ("YYYY-MM-DD", "selected") when the user confirms a date with <CR>
--   (nil,          "cleared")  when the user clears the date with "."
--   (nil,          "cancelled") when the user cancels with <Esc>/q (or closes the window)
function M.pick(opts)
	opts = opts or {}
	local on_select = opts.on_select or function() end

	local current = parse_date(opts.date) or today()
	local td = today()

	local has_snacks, Snacks = pcall(require, "snacks")
	if not has_snacks or not Snacks.win then
		vim.notify("snacks.nvim is required for the calendar picker.", vim.log.levels.ERROR)
		return
	end

	local buf = vim.api.nvim_create_buf(false, true)
	local ns = vim.api.nvim_create_namespace("user_calendar")
	local day_pos = {}

	local function redraw()
		local lines
		lines, day_pos = render_month(current.year, current.month)
		vim.api.nvim_set_option_value("modifiable", true, { buf = buf })
		vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
		vim.api.nvim_set_option_value("modifiable", false, { buf = buf })

		local current_is_today_month = current.year == td.year and current.month == td.month
		apply_highlight(buf, ns, day_pos, current.day, td.day, current_is_today_month)
	end

	redraw()

	-- pick window dimensions from the rendered content
	local lines_count = #vim.api.nvim_buf_get_lines(buf, 0, -1, false)
	local width = 21
	local height = lines_count

	local win_opts = {
		buf = buf,
		relative = opts.relative or "editor",
		position = "float",
		width = width,
		height = height,
		border = "rounded",
		title = opts.title or " Pick a date ",
		title_pos = "center",
		footer = " hl day  jk week  bw mo  BW yr  t today  . clear  <CR> ok ",
		footer_pos = "center",
		style = "minimal",
		wo = {
			cursorline = false,
			number = false,
			relativenumber = false,
			signcolumn = "no",
			wrap = false,
		},
		bo = {
			bufhidden = "wipe",
			buftype = "nofile",
			modifiable = false,
			swapfile = false,
		},
	}
	if opts.row ~= nil then
		win_opts.row = opts.row
	end
	if opts.col ~= nil then
		win_opts.col = opts.col
	end
	-- when caller wants the calendar positioned relative to a parent window
	-- (relative = "win"), they must pass `opts.win` as the parent window handle.
	if opts.win ~= nil then
		win_opts.win = opts.win
	end

	local win = Snacks.win(win_opts)

	local closed = false
	local function close()
		if closed then
			return
		end
		closed = true
		if win and win.close then
			win:close()
		end
	end

	local function place_cursor()
		local pos = day_pos[current.day]
		if pos and win.win and vim.api.nvim_win_is_valid(win.win) then
			vim.api.nvim_win_set_cursor(win.win, { pos.row, pos.col_start })
		end
	end

	local function move_day(n)
		current = add_days(current, n)
		redraw()
		place_cursor()
	end

	local function move_month(n)
		current = add_months(current, n)
		redraw()
		place_cursor()
	end

	local function move_year(n)
		current = add_months(current, n * 12)
		redraw()
		place_cursor()
	end

	local function go_today()
		current = today()
		redraw()
		place_cursor()
	end

	local outcome = nil -- "selected" | "cleared" | "cancelled"
	local result = nil

	local function submit()
		outcome = "selected"
		result = format_date(current)
		close()
	end

	local function clear()
		outcome = "cleared"
		result = nil
		close()
	end

	local function cancel()
		-- outcome stays nil; BufWipeout autocmd will fire on_select with "cancelled"
		close()
	end

	local map_opts = { buffer = buf, nowait = true, silent = true }
	vim.keymap.set("n", "h", function()
		move_day(-1)
	end, map_opts)
	vim.keymap.set("n", "l", function()
		move_day(1)
	end, map_opts)
	vim.keymap.set("n", "j", function()
		move_day(7)
	end, map_opts)
	vim.keymap.set("n", "k", function()
		move_day(-7)
	end, map_opts)
	vim.keymap.set("n", "b", function()
		move_month(-1)
	end, map_opts)
	vim.keymap.set("n", "w", function()
		move_month(1)
	end, map_opts)
	vim.keymap.set("n", "<C-b>", function()
		move_month(-1)
	end, map_opts)
	vim.keymap.set("n", "<C-f>", function()
		move_month(1)
	end, map_opts)
	vim.keymap.set("n", "B", function()
		move_year(-1)
	end, map_opts)
	vim.keymap.set("n", "W", function()
		move_year(1)
	end, map_opts)
	vim.keymap.set("n", "t", go_today, map_opts)
	vim.keymap.set("n", ".", clear, map_opts)
	vim.keymap.set("n", "<CR>", submit, map_opts)
	vim.keymap.set("n", "q", cancel, map_opts)
	vim.keymap.set("n", "<Esc>", cancel, map_opts)

	-- ensures on_select always fires exactly once when the window goes away,
	-- regardless of how it was closed.
	vim.api.nvim_create_autocmd("BufWipeout", {
		buffer = buf,
		once = true,
		callback = function()
			closed = true
			on_select(result, outcome or "cancelled")
		end,
	})

	place_cursor()
end

return M
