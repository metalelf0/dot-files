return {
	"NvChad/nvim-colorizer.lua",
	cmd = { "ColorizerAttachToBuffer" },
	config = function()
		require("colorizer").setup({
			user_default_options = {
				mode = "background", -- can be "background", "foreground" or "virtualtext"
			},
		})
	end,
}
