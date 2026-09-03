local M = {}

local function parse_csv(text)
	local rows = { {} }
	local field = {}
	local quoted = false
	local index = 1

	local function add_field()
		table.insert(rows[#rows], table.concat(field))
		field = {}
	end

	while index <= #text do
		local character = text:sub(index, index)

		if quoted then
			if character == '"' and text:sub(index + 1, index + 1) == '"' then
				table.insert(field, '"')
				index = index + 1
			elseif character == '"' then
				quoted = false
			else
				table.insert(field, character)
			end
		elseif character == '"' and #field == 0 then
			quoted = true
		elseif character == "," then
			add_field()
		elseif character == "\n" then
			add_field()
			table.insert(rows, {})
		elseif character ~= "\r" then
			table.insert(field, character)
		end

		index = index + 1
	end

	if quoted then
		error("CSV contains an unclosed quoted field")
	end

	add_field()
	if #rows[#rows] == 1 and rows[#rows][1] == "" and text:sub(-1) == "\n" then
		table.remove(rows)
	end

	return rows
end

local function visual_selection()
	local start_pos = vim.fn.getpos("'<")
	local end_pos = vim.fn.getpos("'>")
	local lines = vim.api.nvim_buf_get_lines(0, start_pos[2] - 1, end_pos[2], false)

	lines[1] = lines[1]:sub(start_pos[3])
	lines[#lines] = lines[#lines]:sub(1, end_pos[3])
	return table.concat(lines, "\n"), end_pos[2]
end

function M.csv_to_json()
	local text, selection_end_line = visual_selection()
	local rows = parse_csv(text)
	local headers = table.remove(rows, 1)

	if not headers or #headers == 0 then
		vim.notify("CSV selection is empty", vim.log.levels.ERROR)
		return
	end

	local records = {}
	for row_index, row in ipairs(rows) do
		if #row ~= #headers then
			vim.notify(
				("CSV row %d has %d fields; expected %d"):format(row_index + 1, #row, #headers),
				vim.log.levels.ERROR
			)
			return
		end

		local record = {}
		for column, header in ipairs(headers) do
			record[header] = row[column]
		end
		table.insert(records, record)
	end

	vim.api.nvim_buf_set_lines(0, selection_end_line, selection_end_line, false, { vim.json.encode(records) })
end

vim.api.nvim_create_user_command("CsvToJson", M.csv_to_json, {
	desc = "Convert current visual CSV selection to JSON",
	range = true,
})

return M
