return {
	"smoka7/hop.nvim",
	version = "*",
	opts = {
		keys = "etovxqpdygfblzhckisuran",
	},
	keys = {
		{
			"s",
			function()
				require("hop").hint_char2()
			end,
			"n",
			desc = "Jump around",
		},
	},
}
