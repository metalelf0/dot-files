return {
	"nvim-neorg/neorg",
	dependencies = { "akinsho/org-bullets.nvim" },
	opts = {
		load = {
			["core.defaults"] = {},
			["core.concealer"] = {
				config = {
					icon_preset = "diamond",
					icons = {
						todo = {
							undone = {
								icon = "",
							},
							done = {
								icon = "",
							},
							pending = {
								icon = "󰇘",
							},
						},
					},
				},
			},
			["core.completion"] = {
				config = { engine = "nvim-cmp" },
			},
			["core.dirman"] = {
				config = {
					workspaces = {
						notes = "~/neorg/notes",
					},
					default_workspace = "notes",
				},
			},
			["core.integrations.nvim-cmp"] = {},
		},
	},
	run = ":Neorg sync-parsers",
	requires = "nvim-lua/plenary.nvim",
}
