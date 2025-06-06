local config = require("user.config")

local M = {
	"goolord/alpha-nvim",
	enabled = (config.dashboard == "alpha"),
	keys = {
		{ "<leader>a", "<cmd>Alpha<cr>", desc = "Dashboard" },
	},
}

M.footer = function()
	-- NOTE: requires the fortune-mod package to work
	-- local handle = io.popen("fortune")
	-- local fortune = handle:read("*a")
	-- handle:close()
	-- return fortune
	return "metalelf0"
end

M.config = function()
	local core = require("lib/core")

	local status_ok, alpha = pcall(require, "alpha")
	if not status_ok then
		return
	end

	local dashboard = require("alpha.themes.dashboard")

	dashboard.section.header.val = {
		[[ ███╗   ███╗███████╗████████╗ █████╗ ██╗     ███████╗██╗     ███████╗ ██████╗  ]],
		[[ ████╗ ████║██╔════╝╚══██╔══╝██╔══██╗██║     ██╔════╝██║     ██╔════╝██╔═████╗ ]],
		[[ ██╔████╔██║█████╗     ██║   ███████║██║     █████╗  ██║     █████╗  ██║██╔██║ ]],
		[[ ██║╚██╔╝██║██╔══╝     ██║   ██╔══██║██║     ██╔══╝  ██║     ██╔══╝  ████╔╝██║ ]],
		[[ ██║ ╚═╝ ██║███████╗   ██║   ██║  ██║███████╗███████╗███████╗██║     ╚██████╔╝ ]],
		[[ ╚═╝     ╚═╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝╚═╝      ╚═════╝  ]],
		[[                                                                               ]],
	}
	dashboard.section.buttons.val = {
		dashboard.button("f", "  Find file", function()
			Snacks.picker.files()
		end),
		dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
		dashboard.button("p", "  Find project", function()
			Snacks.picker.projects()
		end),
		dashboard.button("r", "  Recently used files", function()
			Snacks.picker.recent()
		end),
		dashboard.button(
			"t",
			"󰈙  Find text",
			':lua require("telescope").extensions.live_grep_args.live_grep_args() <CR>'
		),
		dashboard.button("c", "  Configuration", ":e " .. core.get_configdir() .. "/lua/user/config.lua <CR>"),
		dashboard.button("q", "󰗼  Quit Neovim", ":qa<CR>"),
	}

	dashboard.section.footer.val = M.footer()

	dashboard.section.footer.opts.hl = "Type"
	dashboard.section.header.opts.hl = "Character"
	dashboard.section.buttons.opts.hl = "Keyword"

	dashboard.opts.opts.noautocmd = true

	alpha.setup(dashboard.opts)
end

return M
