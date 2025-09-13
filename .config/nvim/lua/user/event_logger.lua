local utils = require("user.utils")

local EventLogger = {
	enabled = false,
}

local journal_dir = require("user.config").journal_dir

local list_item = "^%- .+$"
local patterns = {
	calls = "^### Calls$",
	tasks = "^### Tasks$",
	events = "^### Events$",
	notes = "^### Notes$",
}

EventLogger.log = function(event_type)
	local target_file = utils.last_journal_file_in_dir(journal_dir)
	local pattern = patterns[event_type]
	local event = vim.fn.input("Enter event text: ")
	EventLogger._log_event(target_file, pattern, event)
end

EventLogger.set_keymaps = function()
	if not EventLogger.enabled then
		return false
	end

	local keymap = vim.keymap.set

	keymap("n", "<leader>olc", function()
		require("user.event_logger").log("calls")
	end, { desc = "Call" })

	keymap("n", "<leader>oln", function()
		require("user.event_logger").log("notes")
	end, { desc = "Note" })

	keymap("n", "<leader>ole", function()
		require("user.event_logger").log("events")
	end, { desc = "Event" })

	keymap("n", "<leader>olt", function()
		require("user.event_logger").log("tasks")
	end, { desc = "Task" })
end

---Return the index of the first line matching the given pattern in the table.
---@param pattern string The regex string with the pattern to search.
---@param file_lines string[] The list of strings to scan
---@return integer | nil The index of the first row matching the given pattern.
EventLogger._get_line_matching = function(pattern, file_lines)
	local line_number = 1
	for _, line in ipairs(file_lines) do
		if line:match(pattern) then
			return line_number
		end
		line_number = line_number + 1
	end
end

---@param event_text string  The text to be formatted and inserted
---@return string formatted_line The formatted line
EventLogger._format_line = function(event_text)
	return "- " .. event_text
end

---Log an event to the provided file.
---@param file_name string the path of the file to write to.
---@param pattern string The pattern after which the provided event text should be written.
---@param event_text string The text to be appended.
EventLogger._log_event = function(file_name, pattern, event_text)
	local lines = utils.read_file(file_name)
	local new_line = EventLogger._format_line(event_text)
	local header_position = EventLogger._get_line_matching(pattern, lines)

	local insert_at = nil

	-- handle whitespace after header
	if header_position then
		if lines[header_position + 1] == "" then
			insert_at = header_position + 2
		else
			insert_at = header_position + 1
			table.insert(lines, header_position + 1, "")
		end

		table.insert(lines, insert_at, new_line)

		-- handle whitespace after header
		if not (string.match(lines[insert_at + 1], list_item)) then
			table.insert(lines, insert_at + 1, "")
		end
	else
		print("Can't find matching header, make sure the " .. file_name .. " file has the right format")
	end

	utils.write_file(file_name, lines)
end

return EventLogger
