local M = {
	"mrjones2014/legendary.nvim",
	lazy = true,
}

function M.config()
	local core = require("lib/core")

	local commands = {
		{ ":EditNeovimConfig", ":e " .. core.get_configdir() .. "/init.lua", description = "Edit neovim config" },
		{ ":EditKittyConfig", ":e ~/.config/kitty/kitty.conf", description = "Edit kitty config" },
		{ ":EditBatConfig", ":e ~/.config/bat/config", description = "Edit bat config" },
		{ ":EditInbox", ":e ~/iCloud-Obsidian/work/inbox.md", description = "Inbox" },
		{
			":EditLazygitConfig",
			":e ~/Library/Application Support/lazygit/config.yml",
			description = "Edit lazygit config",
		},
		{ ":EditWeztermConfig", ":e ~/.config/wezterm/wezterm.lua", description = "Edit wezterm config" },
		-- { ":Neorg gtd capture", description = "Neorg gtd: capture task" },
		-- { ":Neorg gtd views", description = "Neorg gtd: views" },
		{ ":luafile %", description = "Lua: source current file" },
	}

	require("legendary").setup({
		commands = commands,
	})
end

return M
