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
