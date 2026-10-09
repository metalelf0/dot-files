local config = require("user.config")

return {
	-- "stevearc/oil.nvim",
	-- canola.nvim is an oil.nvim maintened repo
	"https://forge.barrettruth.com/barrettruth/canola.nvim",
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
