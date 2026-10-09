local function load_db_connection()
	-- Scan the first 2 lines of the current buffer
	local lines = vim.api.nvim_buf_get_lines(0, 0, 2, false)
	for _, line in ipairs(lines) do
		local target_db = line:match("^DB%s+g:database%s*=%s*(.-)%s*$")

		if target_db then
			if vim.g.database ~= target_db then
				vim.notify("Connecting to the DB...")
				vim.cmd(line)
				vim.notify("Connected!")
				return true
			else
				vim.notify("Already connected, doing nothing...")
			end
		end
	end
	return false
end

-- 1. Create a user command to trigger this manually (:InitDb)
vim.api.nvim_create_user_command("InitDb", load_db_connection, {})

-- 2. Automatically run every time you open or switch to a SQL file
local db_group = vim.api.nvim_create_augroup("DadbodAutoInit", { clear = true })

vim.api.nvim_create_autocmd("BufEnter", {
	group = db_group,
	pattern = "*.sql",
	callback = function()
		load_db_connection()
	end,
})
