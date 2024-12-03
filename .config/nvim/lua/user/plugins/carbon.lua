local M = {
	"ellisonleao/carbon-now.nvim",
	lazy = true,
	cmd = "CarbonNow",
	keys = {
		{ "<leader>cC", ":CarbonNow<CR>", mode = "v", desc = "Pretty preview in CarbonNow" },
	},
}

function M.config()
	require("carbon-now").setup({
		base_url = "https://carbon.now.sh/",
		options = {
			titlebar = "",
			theme = "night-owl",
		},
	})
end

return M
