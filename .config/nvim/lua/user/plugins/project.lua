local M = {
	"metalelf0/project.nvim",
	dev = true,
	event = "VeryLazy",
}

M.config = function()
	local project = require("project_nvim")
	project.setup({
		active = true,
		on_config_done = nil,
		manual_mode = false,
		detection_methods = { "pattern" },
		patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", ".project_root" },
		show_hidden = false,
		silent_chdir = true,
		ignore_lsp = {},
	})

	local telescope = require("telescope")
	telescope.load_extension("projects")
end

return M
