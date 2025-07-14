local M = {}

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

return M
