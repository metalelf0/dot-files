local M = {
	"goolord/alpha-nvim",
	enabled = false,
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
		[[                  __             ___           ___       ___    __     ]],
		[[                 /\ \__         /\_ \         /\_ \    /'___\ /'__`\   ]],
		[[  ___ ___      __\ \ ,_\    __  \//\ \      __\//\ \  /\ \__//\ \/\ \  ]],
		[[/' __` __`\  /'__`\ \ \/  /'__`\  \ \ \   /'__`\\ \ \ \ \ ,__\ \ \ \ \ ]],
		[[/\ \/\ \/\ \/\  __/\ \ \_/\ \L\.\_ \_\ \_/\  __/ \_\ \_\ \ \_/\ \ \_\ \]],
		[[\ \_\ \_\ \_\ \____\\ \__\ \__/.\_\/\____\ \____\/\____\\ \_\  \ \____/]],
		[[ \/_/\/_/\/_/\/____/ \/__/\/__/\/_/\/____/\/____/\/____/ \/_/   \/___/ ]],
	}
	dashboard.section.buttons.val = {
		dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
		dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
		dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
		dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
		dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
		dashboard.button("c", "  Configuration", ":e " .. core.get_configdir() .. "/init.lua <CR>"),
		dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
	}

	dashboard.section.footer.val = M.footer()

	dashboard.section.footer.opts.hl = "Type"
	dashboard.section.header.opts.hl = "Character"
	dashboard.section.buttons.opts.hl = "Keyword"

	dashboard.opts.opts.noautocmd = true

	alpha.setup(dashboard.opts)
end

return M
