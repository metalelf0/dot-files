local M = {}

-- Date-marker symbols used on task lines (Done, Planned, Started, Canceled, Added).
M.DATE_SYMBOLS = { "✅", "📅", "🛫", "❌", "➕" }

-- Returns true if `line` is an obsidian task line (e.g. "- [ ] #task ...").
function M.is_task_line(line)
	return line:match("^%- %[.%] #task") ~= nil
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
