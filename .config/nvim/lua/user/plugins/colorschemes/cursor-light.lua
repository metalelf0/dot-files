local config = require("user.config")
local utils = require("user.utils")
local themer = require("user.themer")

local colorscheme = "cursor-light"

local M = {
	"vpoltora/cursor-light.nvim",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

-- The palette:
-- Background        White         #FCFCFC
-- Foreground        Dark-Gray     #141414
-- Keywords          Red           #B31B3F
-- Functions         Orange        #DB704B
-- Strings           Purple        #9E94D5
-- Types             Blue          #206595
-- Comments          Gray-(italic) #6F6F6F
-- Constants         Blue          #206595
-- Numbers           Magenta       #B8448B
-- Properties        Purple-Blue   #6049B3
-- Built-ins         Teal          #6F9BA6
-- Macros/Decorators Green         #1F8A65

M.config = function()
	if config.colorscheme ~= "cursor-light" then
		return false
	end
	require("cursor-light").setup({
		ui = true,
	})
	vim.cmd.colorscheme("cursor-light")
end

return M
