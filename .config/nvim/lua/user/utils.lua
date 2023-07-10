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

M.find_files_in_dir = function(directory)
	require("telescope.builtin").find_files({ cwd = directory, search_dirs = { directory } })
end

M.search_files_in_dir = function(directory)
	require("telescope.builtin").live_grep({ cwd = directory, search_dirs = { directory } })
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

return M
