local config = require("user.config")

return {
	"delphinus/md-render.nvim",
	dependencies = {
		{ "nvim-tree/nvim-web-devicons", version = "*" }, -- optional: file type icons in code blocks
		{ "delphinus/budoux.lua", version = "*" }, -- optional: CJK phrase-level line breaking
	},
}
