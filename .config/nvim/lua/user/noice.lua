local config = require("user.config")
local packer = require("packer")
local use = packer.use

local M = {}

M.requirePlugin = function()
end

M.setupPlugin = function()
  if false then
    use({
      "folke/noice.nvim",
      event = "VimEnter",
      config = function()
        require("noice").setup({
          routes = {
            {
              filter = { event = "msg_show", find = "not a git repository" },
              opts = { skip = true },
            },
            {
              filter = { event = "msg_show", find = "is outside repository at" },
              opts = { skip = true },
            },
          },
        })
      end,
      requires = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify", "hrsh7th/nvim-cmp" },
    })
  end
end

return M
