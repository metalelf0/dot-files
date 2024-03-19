local config = require("user.config")

return {
	"stevearc/oil.nvim",
	lazy = false,
	enabled = (config.filemanager == "oil"),
	config = function()
		require("oil").setup({
			default_file_explorer = true,
			columns = {
				"icon",
			},
		})
	end,
}
