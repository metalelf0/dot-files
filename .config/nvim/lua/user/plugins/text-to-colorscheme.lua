return {
	"svermeulen/text-to-colorscheme",
	cmd = "T2CGenerate",
	config = function()
		require("text-to-colorscheme").setup({
			ai = {
				openai_api_key = os.getenv("OPENAI_API_KEY"),
				gpt_model = "gpt-4o",
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
        {
					name = "Liverpool FC",
					background_mode = "dark",
          background = "#0A0A0A",
          foreground = "#FFFFFF",
          accents = {
             "#C8102E", -- Red (Liverpool's primary color)
             "#00A398", -- Teal (Accent)
             "#FFD700", -- Gold (Champions League Trophy)
             "#1D428A", -- Blue (UEFA colors)
             "#C0C0C0", -- Silver (Medals)
             "#E6E6E6", -- Light Gray (Neutral accent)
             "#FFFFFF", -- White (Neutral accent)
          },
        }
			},
		})
	end,
}
