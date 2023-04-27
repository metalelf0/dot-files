return {
	"nvim-neorg/neorg",
	ft = "norg",
	dependencies = { "akinsho/org-bullets.nvim" },
	opts = {
		load = {
			["core.defaults"] = {},
			["core.norg.concealer"] = {},
			["core.norg.completion"] = {
				config = { engine = "nvim-cmp" },
			},
			["core.integrations.nvim-cmp"] = {},
		},
	},
}
