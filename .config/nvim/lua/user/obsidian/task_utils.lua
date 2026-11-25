local M = {}

-- Date-marker symbols used on task lines (Done, Due, Scheduled, Started, Canceled, Added).
M.DATE_SYMBOLS = { "✅", "📅", "⏳", "🛫", "❌", "➕" }

-- Maps each date marker to the key it fills in a parsed task's `dates` table.
M.DATE_MARKER_KEYS = {
	["➕"] = "created",
	["🛫"] = "started",
	["⏳"] = "scheduled",
	["📅"] = "planned",
	["❌"] = "cancelled",
}

-- Maps each priority icon to its priority name.
M.PRIORITY_ICONS = {
	["🔺"] = "highest",
	["⏫"] = "high",
	["🔼"] = "medium",
	["🔽"] = "low",
	["⏬"] = "lowest",
}

-- Single-token markers, mapped to the key they fill in a parsed task's `extras` table.
M.EXTRA_MARKERS = {
	["🆔"] = "id",
	["⛔"] = "depends_on",
	["🏁"] = "on_completion",
}

-- The recurrence marker's value is free text (e.g. "every week"), so it runs to end of line.
M.RECURRENCE_MARKER = "🔁"

-- The completion marker lives in `extras`, but its value is a date.
M.DONE_MARKERS = {
	["✅"] = "done",
}

-- True when `text` is a "YYYY-MM-DD" date.
local function is_date(text)
	return text:match("^%d%d%d%d%-%d%d%-%d%d$") ~= nil
end

-- Collects marker values into `target`, consuming the marker and its value from `rest`.
local function collect_markers(rest, markers, target, expect_date)
	for marker, key in pairs(markers) do
		local pattern = marker .. " (%S+)"
		local s, e, value = rest:find(pattern)
		if s and (not expect_date or is_date(value)) then
			target[key] = value
			rest = rest:sub(1, s - 1) .. rest:sub(e + 1)
		end
	end
	return rest
end

-- Returns the column where the first recognised marker starts, or nil.
local function first_marker_start(text)
	local earliest
	for marker in pairs(M.DATE_MARKER_KEYS) do
		local s = text:find(" " .. marker)
		if s and (earliest == nil or s < earliest) then
			earliest = s
		end
	end
	for marker in pairs(M.PRIORITY_ICONS) do
		local s = text:find(" " .. marker)
		if s and (earliest == nil or s < earliest) then
			earliest = s
		end
	end
	for marker in pairs(M.EXTRA_MARKERS) do
		local s = text:find(" " .. marker)
		if s and (earliest == nil or s < earliest) then
			earliest = s
		end
	end
	local recurrence = text:find(" " .. M.RECURRENCE_MARKER)
	if recurrence and (earliest == nil or recurrence < earliest) then
		earliest = recurrence
	end
	for marker in pairs(M.DONE_MARKERS) do
		local s = text:find(" " .. marker .. " %d%d%d%d%-%d%d%-%d%d")
		if s and (earliest == nil or s < earliest) then
			earliest = s
		end
	end
	return earliest
end

-- Parses an obsidian task line into its title, dates, priority and extra fields.
-- Returns nil when `line` is not an obsidian task line.
function M.parse_task(line)
	if not M.is_task_line(line) then
		return nil
	end

	local body = line:gsub("^%- %[.%] #task ", "", 1)
	local task = {
		title = "",
		status = line:sub(4, 4),
		dates = {},
		extras = {},
		priority = "medium",
	}

	local boundary = first_marker_start(body)
	task.title = (boundary and body:sub(1, boundary - 1) or body):gsub("%s+$", "")

	for marker, priority in pairs(M.PRIORITY_ICONS) do
		if body:find(marker, 1, true) then
			task.priority = priority
			break
		end
	end

	body = collect_markers(body, M.DATE_MARKER_KEYS, task.dates, true)
	body = collect_markers(body, M.DONE_MARKERS, task.extras, true)
	body = collect_markers(body, M.EXTRA_MARKERS, task.extras, false)
	-- Extracted last: its value runs to end of line, so the other markers must be gone first.
	local recurrence_start = body:find(" " .. M.RECURRENCE_MARKER .. " ")
	if recurrence_start then
		-- Skip the leading space, the 4-byte marker, and the space after it.
		task.extras.recurrence = (body:sub(recurrence_start + 6):gsub("%s+$", ""))
	end

	return task
end

-- Returns true if `line` is an obsidian task line (e.g. "- [ ] #task ...").
function M.is_task_line(line)
	return line:match("^%- %[.%] #task") ~= nil
end

-- Returns true for open Obsidian tasks: todo and in-progress.
function M.is_open_task_line(line)
	return line:match("^%- %[ %] #task") ~= nil or line:match("^%- %[/%] #task") ~= nil
end

-- Finds byte ranges of " YYYY-MM-DD" segments following date symbols on a line.
-- Returns a list of { start_col, end_col } pairs in 0-indexed / end-exclusive form.
function M.find_date_ranges(line)
	local ranges = {}
	for _, sym in ipairs(M.DATE_SYMBOLS) do
		local init = 1
		while true do
			local s, e = line:find(sym .. " %d%d%d%d%-%d%d%-%d%d", init, false)
			if not s then
				break
			end
			-- Conceal just the trailing " YYYY-MM-DD" part, keep the symbol visible.
			local date_start = s + #sym - 1
			table.insert(ranges, { date_start, e })
			init = e + 1
		end
	end
	return ranges
end

return M
