local config = require("user.config")

local M = {
  'ribru17/bamboo.nvim',
  lazy = false,
  priority = 1000,
	enabled = (config.colorscheme == "bamboo")
}

M.config = function()
    require('bamboo').setup {
      -- optional configuration here
    }
    require('bamboo').load()
  end

return M
