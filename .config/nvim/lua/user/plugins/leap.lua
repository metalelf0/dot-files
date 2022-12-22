local M = {
    "ggandor/leap.nvim"
}

M.config = function()
  local leap = M.requireLeap()
  leap.setup({
    case_insensitive = true,
  })
  M.setKeymaps()
end

M.requireLeap = function()
  return require("leap")
end

M.leap_bidirectional = function()
  M.requireLeap().leap({ target_windows = { vim.fn.win_getid() } })
end

M.setKeymaps = function()
  vim.keymap.set("x", "s", "<Plug>(leap-forward)", { silent = true })
  vim.keymap.set("x", "S", "<Plug>(leap-backward)", { silent = true })
  vim.keymap.set("o", "z", "<Plug>(leap-forward)", { silent = true })
  vim.keymap.set("o", "Z", "<Plug>(leap-backward)", { silent = true })
  vim.keymap.set("o", "x", "<Plug>(leap-forward-x)", { silent = true })
  vim.keymap.set("o", "X", "<Plug>(leap-backward-x)", { silent = true })
  vim.keymap.set("n", "gs", "<Plug>(leap-cross-window)", { silent = true })
  vim.keymap.set("x", "gs", "<Plug>(leap-cross-window)", { silent = true })
  vim.keymap.set("o", "gs", "<Plug>(leap-cross-window)", { silent = true })

  vim.keymap.set("n", "s", M.leap_bidirectional, { silent = true })
end

return M
