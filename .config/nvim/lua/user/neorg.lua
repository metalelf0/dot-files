require("neorg").setup({
	-- Tell Neorg what modules to load
	load = {
		["core.defaults"] = {}, -- Load all the default modules
		["core.norg.concealer"] = {}, -- Allows for use of icons
     ["core.integrations.telescope"] = {}, -- Enable the telescope module
		["core.norg.dirman"] = { -- Manage your directories with Neorg
			config = {
				workspaces = {
					notes    = "~/neorg/notes",
          gtd      = "~/neorg/gtd",
				},
			},
		},
    ["core.gtd.base"] = {
      config = {
        workspace = "gtd",
      },
    },
		["core.norg.completion"] = {
			config = {
				engine = "nvim-cmp",
			},
		},
		["core.keybinds"] = { -- Configure core.keybinds
			config = {
				default_keybinds = true, -- Generate the default keybinds
				neorg_leader = "<Leader>o", -- This is the default if unspecified
			},
		},
    ["core.export"] = {},
    ["core.export.markdown"] = { config = { extensions = "all" } },
	},
})
