local config = require("user.config")
local utils = require("user.utils")
local themer = require("user.themer")

local colorscheme = "darkbox"

local M = {
	"timmypidashev/darkbox.nvim",
}

M.config = function()
	if config.colorscheme ~= "darkbox" then
		return false
	end
	require("darkbox").load()
end

return M
