local win_id = nil
local buf_id = nil

vim.api.nvim_create_user_command("DbToJson", function()
	-- 1. Get current buffer lines (excluding the last line)
	local src_buf = vim.api.nvim_get_current_buf()
	local line_count = vim.api.nvim_buf_line_count(src_buf)
	local lines = {}
	if line_count > 1 then
		lines = vim.api.nvim_buf_get_lines(src_buf, 0, line_count - 1, false)
	end

	-- 2. Open or reuse the side window on the right
	if not (win_id and vim.api.nvim_win_is_valid(win_id)) then
		vim.cmd("botright vsplit")
		win_id = vim.api.nvim_get_current_win()

		if not (buf_id and vim.api.nvim_buf_is_valid(buf_id)) then
			buf_id = vim.api.nvim_create_buf(false, true) -- Scratch buffer (unlisted, non-file)
			vim.api.nvim_buf_set_name(buf_id, "db_output.json")
		end
		vim.api.nvim_win_set_buf(win_id, buf_id)
	else
		vim.api.nvim_set_current_win(win_id)
	end

	-- 3. Replace side window content with copied lines
	vim.api.nvim_buf_set_lines(buf_id, 0, -1, false, lines)

	-- 4. Set filetype to json
	vim.bo[buf_id].filetype = "json"

	-- 5. Run python filter script on the side window buffer
	vim.cmd("%!python3 ~/bin/db-to-json.py")
end, {})
