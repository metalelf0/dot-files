require("nvim-surround").setup({
  surrounds = {
    [":"] = {
      add = { ":", "" },
      delete = function() end,
      change = { target = function() end },
    },
  },
})
