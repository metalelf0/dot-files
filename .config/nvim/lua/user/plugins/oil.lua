local config = require("user.config")

return {
	"stevearc/oil.nvim",
	lazy = true,
	enabled = (config.filemanager == "oil"),
	config = function()
		require("oil").setup({
			columns = {
				-- "icon"
			},
		})
	end,
}
