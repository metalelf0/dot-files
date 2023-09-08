local M = {
	"glepnir/dashboard-nvim",
	event = "VimEnter",
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
	enabled = false,
}

M.footer = function()
	return "metalelf0"
end

M.config = function()
	local core = require("lib/core")

	local dashboard = require("dashboard")
	dashboard.setup({
		theme = "hyper",
		config = {
			header = {
				[[ ███╗   ███╗███████╗████████╗ █████╗ ██╗     ███████╗██╗     ███████╗ ██████╗  ]],
				[[ ████╗ ████║██╔════╝╚══██╔══╝██╔══██╗██║     ██╔════╝██║     ██╔════╝██╔═████╗ ]],
				[[ ██╔████╔██║█████╗     ██║   ███████║██║     █████╗  ██║     █████╗  ██║██╔██║ ]],
				[[ ██║╚██╔╝██║██╔══╝     ██║   ██╔══██║██║     ██╔══╝  ██║     ██╔══╝  ████╔╝██║ ]],
				[[ ██║ ╚═╝ ██║███████╗   ██║   ██║  ██║███████╗███████╗███████╗██║     ╚██████╔╝ ]],
				[[ ╚═╝     ╚═╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝╚═╝      ╚═════╝  ]],
				[[                                                                               ]],
			},
			shortcut = {
				{ desc = "  Update", group = "@property", action = "Lazy update", key = "u" },
				{
					desc = "  Recently used files",
					group = "DiagnosticHint",
					action = "Telescope oldfiles",
					key = "r",
				},
				{
					desc = "  Find project",
					group = "DiagnosticHint",
					action = "Telescope projects",
					key = "p",
				},
				{
					desc = "  Configuration",
					group = "DiagnosticHint",
					action = ":e " .. core.get_configdir() .. "/lua/user/config.lua",
					key = "c",
				},
			},
		},
	})
end

return M

-- dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
-- dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
-- dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
