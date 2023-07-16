local M = {}

local function supermover(prompt_bufnr, map)
	local actions = require("telescope.actions")
	local action_state = require("telescope.actions.state")

	actions.select_default:replace(function()
		actions.close(prompt_bufnr)
		local selection = action_state.get_selected_entry()
		vim.api.nvim_command("Move " .. selection[1])
	end)

	map({ "i", "n" }, "<C-n>", function(prompt_bufnr)
		actions.close(prompt_bufnr)
		local selection = action_state.get_selected_entry()
		local new_dir_name = vim.fn.input("New dir name (under " .. selection[1] .. "): ")

		new_dir = vim.fs.joinpath(selection[1], new_dir_name)
		vim.api.nvim_command("Mkdir " .. new_dir)
		vim.api.nvim_command("Move " .. new_dir)
	end)

	return true
end

M.supamove = function()
	require("telescope.builtin").find_files({
		find_command = { "fd", "--type", "d" },
		attach_mappings = supermover,
	})
end

return M
