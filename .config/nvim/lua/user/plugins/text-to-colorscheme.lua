return {
	"svermeulen/text-to-colorscheme",
	cmd = "T2CGenerate",
	config = function()
		require("text-to-colorscheme").setup({
			ai = {
				openai_api_key = os.getenv("OPENAI_API_KEY"),
			},
			hex_palettes = {
				{
					name = "Liverpool docks on a winter night",
					background_mode = "dark",
					background = "#0d0f13",
					foreground = "#a7aaa8",
					accents = {
						"#5f819d",
						"#507873",
						"#8c7a6e",
						"#a3685a",
						"#707880",
						"#ab4642",
						"#899a5c",
					},
				},
			},
		})
	end,
}
