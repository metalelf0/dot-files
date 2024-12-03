local M = {}
local core = require("lib/core")

M.commands = {}

M.commands.EditNeovimConfig = {
	command = ":e " .. core.get_configdir() .. "/init.lua",
	description = "🌑 Edit neovim config",
}

M.commands.EditBatConfig = { command = ":e ~/.config/bat/config", description = "🦇 Edit bat config" }
M.commands.EditInbox = { command = ":e ~/iCloud-Obsidian/work/inbox.md", description = "📥 Inbox" }
M.commands.EditKittyConfig = { command = ":e ~/.config/kitty/kitty.conf", description = "🐱 Edit kitty config" }
M.commands.EditTmuxConfig = { command = ":e ~/.config/tmux/tmux.conf", description = "🍱 Edit tmux config" }
M.commands.EditLazygitConfig =
	{ command = ":e ~/Library/Application Support/lazygit/config.yml", description = "🔱 Edit lazygit config" }
M.commands.EditWeztermConfig =
	{ command = ":e ~/.config/wezterm/wezterm.lua", description = "🔧 Edit Wezterm config" }
M.commands.EditGhosttyConfig = { command = ":e ~/.config/ghostty/config", description = "👻 Edit Ghostty config" }
M.commands.SourceCurrentLuaFile = { command = ":luafile %", description = "🏄 Lua: source current file" }

M.run = function()
	vim.ui.select(vim.tbl_keys(M.commands), {
		prompt = "Whattya wanna do?",
		format_item = function(item)
			return M.commands[item].description
		end,
	}, function(choice)
		local chosen_command = M.commands[choice]
		vim.cmd(chosen_command.command)
	end)
end

return M
