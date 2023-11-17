local config = require("user.config")
local themer = require("user.themer")

local colorscheme = "serenity"

local M = {
	"Wansmer/serenity.nvim",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

M.palette = {
	black = "#000000",
}

M.config = function()
	if config.colorscheme ~= "serenity" then
		return false
	end

	local function set_colors(fg, bg)
		return "guifg=" .. fg .. " guibg=" .. bg
	end

	require("serenity").setup()
	vim.cmd("colorscheme serenity")

	local api = vim.api
	api.nvim_command("hi clear @text.todo.checked.markdown")
	api.nvim_command("hi link @text.todo.checked.markdown @comment")
	api.nvim_command("hi clear @text.todo.unchecked.markdown")
	api.nvim_command("hi link @text.todo.unchecked.markdown @string")
	api.nvim_command("hi clear NonText")
	api.nvim_command("hi NonText " .. set_colors(M.palette.black, M.palette.black))
end

return M
