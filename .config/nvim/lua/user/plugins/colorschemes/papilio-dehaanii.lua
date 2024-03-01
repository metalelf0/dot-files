local config = require("user.config")
local utils = require("user.utils")
local themer = require("user.themer")

local colorscheme = "papilio-dehaanii"

local M = {
	"keiyakeiya/PapilioDehaanii.vim",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

M.config = function()
	if config.colorscheme ~= "papilio-dehaanii" then
		return false
	end

	local setup = [[
    colorscheme papilio_dehaanii
	 ]]

	vim.cmd(setup)
end

return M
