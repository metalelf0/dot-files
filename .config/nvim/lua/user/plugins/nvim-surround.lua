local M = {
  "kylechui/nvim-surround",
  event = "VeryLazy"
}

function M.config()
  require("nvim-surround").setup({
    surrounds = {
      [":"] = {
        add = { ":", "" },
        delete = function() end,
        change = { target = function() end },
      },
    },
  })
end

return M
