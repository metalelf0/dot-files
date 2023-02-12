local M = {}

M.pick_hashtags = function(opts)
	local pickers = require("telescope.pickers")
	local finders = require("telescope.finders")
	local conf = require("telescope.config").values
	local actions = require("telescope.actions")
	local action_state = require("telescope.actions.state")

	opts = opts or {}
	local input = {
		"rg",
		"--no-heading",
		"--trim",
		"-NIo",
		"\\s+#([\\w-]+)",
	}

	pickers
		.new(opts, {
			prompt_title = "Hashtags",
			finder = finders.new_oneshot_job(input, {}),
			sorter = conf.generic_sorter(opts),
			attach_mappings = function(prompt_bufnr, map)
				actions.select_default:replace(function()
					actions.close(prompt_bufnr)
					local selection = action_state.get_selected_entry()
					vim.api.nvim_put({ selection[1] }, "", false, true)
				end)
				return true
			end,
		})
		:find()
end

return M
