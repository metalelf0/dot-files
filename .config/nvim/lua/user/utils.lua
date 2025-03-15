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

function M.longest_path()
	local current_dir = vim.fn.getcwd()
	local fd_command = "fd . " .. vim.fn.shellescape(current_dir)
	local fd_output = vim.fn.systemlist(fd_command)
	local longest_length = 0
	if #fd_output == 0 then
		print("No files found with fd command")
		return 0
	end

	for _, file_path in ipairs(fd_output) do
		local path_length = vim.fn.strwidth(file_path)
		longest_length = math.max(longest_length, path_length)
	end
	return longest_length
end

--- Calculate a weighted length metric for a file path as it would appear in the Snacks file explorer.
--- This function computes a metric that represents the visual space a path might take in a file explorer,
--- where deeper nested files are indented. The metric is calculated as:
--- (number of path separators * 3) + (length of the file name)
---
--- @param file_path string The file path to analyze
--- @return number The calculated length metric for the file path
function M.path_length_as_explorer_entry(file_path)
	if not file_path or file_path == "" then
		return 0
	end

	local separator_count = 0
	for _ in string.gmatch(file_path, "[/\\]") do
		separator_count = separator_count + 1
	end

	local last_element = string.match(file_path, "[^/\\]+$") or file_path
	local last_element_length = #last_element

	local result = (separator_count * 3) + last_element_length
	return result
end

function M.longest_path_perc(percentile, opts)
	opts = opts or {}
	local directory = opts.directory or vim.fn.getcwd()
	local pattern = opts.pattern or "."
	local fd_args = "-d 1"

	-- Build the fd command
	local fd_command = string.format("fd %s %s %s", fd_args, vim.fn.shellescape(pattern), vim.fn.shellescape(directory))

	-- Run fd command and capture output
	local ok, fd_output = pcall(vim.fn.systemlist, fd_command)

	-- Check for errors
	if not ok then
		vim.notify("Error running fd command: " .. fd_output, vim.log.levels.ERROR)
		return 0
	end

	-- Check if fd command failed
	if vim.v.shell_error ~= 0 then
		vim.notify("fd command failed with exit code: " .. vim.v.shell_error, vim.log.levels.WARN)
		return 0
	end

	-- Check if we got any results
	if #fd_output == 0 then
		vim.notify("No files found with fd command", vim.log.levels.INFO)
		return 0
	end

	-- Calculate lengths of all paths
	local lengths = {}
	for _, file_path in ipairs(fd_output) do
		vim.print(file_path)
		table.insert(lengths, M.path_length_as_explorer_entry(file_path))
	end

	-- Sort lengths in ascending order
	table.sort(lengths)

	-- Calculate the 95th percentile index
	-- Formula: p * (n + 1) where p is the percentile (0.95) and n is the number of elements
	local p = percentile / 100
	local index = math.ceil(p * #lengths)

	-- Ensure index is within bounds
	index = math.min(index, #lengths)

	-- Return the 95th percentile length
	return lengths[index]
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

M.last_journal_file_in_dir = function(path)
	local lfs = require("lfs")
	local files = {}

	for file in lfs.dir(path) do
		if file ~= "." and file ~= ".." and string.match(file, "%d+%-%d+%-%d+%.md$") then
			table.insert(files, file)
		end
	end

	table.sort(files)

	local lastChar = path:sub(#path, #path)
	if lastChar ~= "/" then
		path = path .. "/"
	end

	return path .. files[#files]
end

M.open_jira_task_visual = function()
	local fn = vim.fn
	local s = fn.getpos("'<")
	local e = fn.getpos("'>")
	local line = fn.getline(s[2])
	local task_name = string.sub(line, s[3], e[3])
	print("Line is " .. line)
	print("Task name is " .. task_name)
	local url = "https://telepass.atlassian.net/browse/" .. task_name

	print("Going to open " .. url)
	M.open_link_in_browser(url)
end

M.open_link_in_browser = function(url)
	local vim = vim
	local api = vim.api
	local fn = vim.fn

	local command

	if fn.has("macunix") == 1 then
		command = "open"
	elseif fn.has("win32") == 1 or fn.has("win64") == 1 or fn.has("win16") == 1 then
		command = "start"
	else
		command = "xdg-open"
	end

	local finalCommand = string.format("%s %s", command, url)

	vim.cmd("! " .. finalCommand)
end

M.toggle_indent_lines = function()
	local snacks = require("snacks")
	if snacks.indent.enabled then
		snacks.indent.disable()
	else
		snacks.indent.enable()
	end
end

return M
