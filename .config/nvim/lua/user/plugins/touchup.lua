local config = require("user.config")

return {
	"noisesfromspace/touchup.nvim",
	dev = true,
	enabled = (config.markdown_plugin == "touchup"),
	opts = {
		checkboxes = {
			icons = {
				["m"] = { text = "󰋋", hl = "TouchupCheckboxChecked" },
				["n"] = { text = "", hl = "TouchupCheckboxChecked" },
			},
		},
	},
}
