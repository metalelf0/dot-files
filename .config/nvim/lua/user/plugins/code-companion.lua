-- lazy.nvim
return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function(_, opts)
		require("codecompanion").setup(opts)
	end,
	opts = {
		adapters = {
			http = {
				extend = {
					openai_compatible = {
						url = "${url}/chat/completions",
						env = {
							url = "EDGEE_API_URL",
							api_key = "EDGEE_API_KEY",
							chat_url = "",
							models_endpoint = "/models",
						},
					},
				},
			},
		},
		interactions = {
			chat = {
				adapter = "openai_compatible",
			},
		},
		display = {
			chat = {
				show_model_chooser = true,
			},
		},
	},
}
