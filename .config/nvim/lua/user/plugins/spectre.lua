return {
	"nvim-pack/nvim-spectre",
	build = false,
	enabled = false,
	cmd = "Spectre",
	opts = { open_cmd = "noswapfile vnew" },
	keys = {
		{
			"<leader>sf",
			function()
				require("spectre").open_file_search()
			end,
			desc = "Search in file (spectre)",
		},
		{
			"<leader>ss",
			function()
				require("spectre").open()
			end,
			desc = "Spectre",
		},
		{
			"<leader>Sv",
			function()
				require("spectre").open_visual()
			end,
			mode = "v",
			desc = "Open spectre",
		},
		{
			"<leader>Sw",
			function()
				require("spectre").open_visual({ select_word = true })
			end,
			mode = "v",
			desc = "Search word",
		},
	},
	config = function()
		require("spectre").setup()
	end,
}
