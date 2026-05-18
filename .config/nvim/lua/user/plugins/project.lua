local M = {
	"DrKJeff16/project.nvim",
	-- "ahmedkhalf/project.nvim",
	-- dev = true,
	event = "VeryLazy",
}

M.config = function()
	local project = require("project")
	project.setup({
		patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", ".project_root" },
	})

	local telescope = require("telescope")
	telescope.load_extension("projects")
end

return M
