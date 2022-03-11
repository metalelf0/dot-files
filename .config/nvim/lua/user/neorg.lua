require("neorg").setup({
	-- Tell Neorg what modules to load
	load = {
		["core.defaults"] = {}, -- Load all the default modules
		["core.norg.concealer"] = {}, -- Allows for use of icons
     ["core.integrations.telescope"] = {}, -- Enable the telescope module
		["core.norg.dirman"] = { -- Manage your directories with Neorg
			config = {
				workspaces = {
					default  = "~/neorg/notes",
          gtd      = "~/neorg/gtd",
				},
        autochdir = false,
        index = "index.norg",
        last_workspace = vim.fn.stdpath("cache") .. "/neorg_last_workspace.txt" -- The location to write and read the workspace cache file

			},
		},
		["core.norg.completion"] = {
			config = {
				engine = "nvim-cmp",
			},
		},
		["core.gtd.base"] = {
			config = { -- Note that this table is optional and doesn't need to be provided
        workspace = 'gtd'
			},
		},
		["core.keybinds"] = { -- Configure core.keybinds
			config = {
				default_keybinds = true, -- Generate the default keybinds
				neorg_leader = "<Leader>o", -- This is the default if unspecified
			},
		},
	},
})
