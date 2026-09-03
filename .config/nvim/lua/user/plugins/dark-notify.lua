local config = require("user.config")

return {
	"cormacrelf/dark-notify",
	enabled = false,
	config = function()
		require("dark_notify").run({
			schemes = {
				dark = config.dark_colorscheme,
				light = config.light_colorscheme,
			},
			onchange = function(mode)
				local theme = ""
				if mode == "dark" then
					theme = config.dark_colorscheme
				else
					theme = config.light_colorscheme
				end
				config.colorscheme = theme
				require("user.plugins.colorschemes." .. theme).after()
			end,
		})
	end,
}
