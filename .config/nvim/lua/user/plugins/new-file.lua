local config = require("user.config")
local picker = nil

if config.picker == "snacks" then
	picker = "snacks"
elseif config.picker == "telescope" then
	picker = "telescope"
end

return {
	"patrix726/new-file.nvim",
	opts = {
		picker = picker,
	},
	keys = {
		{
			"<leader>fn",
			function()
				require("new-file").open()
			end,
			mode = "n",
			{ desc = "(Advanced) new file" },
		},
	},
}
