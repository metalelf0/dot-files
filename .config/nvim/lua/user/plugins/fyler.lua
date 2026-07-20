local config = require("user.config")

return {
	"FylerOrg/fyler.nvim",
	enabled = (config.filemanager == "fyler"),
	opts = {},
}
