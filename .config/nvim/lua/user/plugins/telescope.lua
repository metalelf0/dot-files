local function project_files()
	local opts = {}
	if vim.loop.fs_stat(".git") then
		opts.show_untracked = true
		require("telescope.builtin").git_files(opts)
	else
		local client = vim.lsp.get_active_clients()[1]
		if client then
			opts.cwd = client.config.root_dir
		end
		require("telescope.builtin").find_files(opts)
	end
end

return {
	"nvim-telescope/telescope.nvim",
	cmd = { "Telescope" },
	dependencies = {
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-telescope/telescope-symbols.nvim",
	},
	keys = {
		-- { "<leader><space>", project_files, desc = "Find File" },
	},
	config = function()
		-- local actions = require("telescope.actions")

		local telescope = require("telescope")
		local borderless = true
		telescope.setup({
			defaults = {
				layout_strategy = "horizontal",
				layout_config = {
					prompt_position = "top",
				},
				sorting_strategy = "ascending",
				mappings = {
					i = {
						["<C-j>"] = require("telescope.actions").move_selection_next,
						["<C-k>"] = require("telescope.actions").move_selection_previous,
						["<C-c>"] = require("telescope.actions").close,
						["<c-t>"] = function(...)
							return require("trouble.providers.telescope").open_with_trouble(...)
						end,
						["<C-Down>"] = function(...)
							return require("telescope.actions").cycle_history_next(...)
						end,
						["<C-Up>"] = function(...)
							return require("telescope.actions").cycle_history_prev(...)
						end,
						["<C-w>"] = function()
							vim.cmd([[normal! bcw]])
						end,
						["<C-g>"] = function()
							require("telescope.builtin").symbols({ sources = { "gitmoji" } })
						end,
					},
				},
				prompt_prefix = " ",
				selection_caret = " ",
				path_display = { shorten = 3, truncate = 3 },
				winblend = borderless and 0 or 10,
				dynamic_preview_title = true,
			},
		})
		telescope.load_extension("fzf")
	end,
}
