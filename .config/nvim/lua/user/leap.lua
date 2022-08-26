local leap = require("leap")
leap.setup({
  case_insensitive = true,
})
-- leap.set_default_keymaps()
local function leap_bidirectional()
  require("leap").leap({ target_windows = { vim.fn.win_getid() } })
end

-- vim.keymap.set("n", "s", "<Plug>(leap-forward)", { silent = true })
-- vim.keymap.set("n", "S", "<Plug>(leap-backward)", { silent = true })
vim.keymap.set("x", "s", "<Plug>(leap-forward)", { silent = true })
vim.keymap.set("x", "S", "<Plug>(leap-backward)", { silent = true })
vim.keymap.set("o", "z", "<Plug>(leap-forward)", { silent = true })
vim.keymap.set("o", "Z", "<Plug>(leap-backward)", { silent = true })
vim.keymap.set("o", "x", "<Plug>(leap-forward-x)", { silent = true })
vim.keymap.set("o", "X", "<Plug>(leap-backward-x)", { silent = true })
vim.keymap.set("n", "gs", "<Plug>(leap-cross-window)", { silent = true })
vim.keymap.set("x", "gs", "<Plug>(leap-cross-window)", { silent = true })
vim.keymap.set("o", "gs", "<Plug>(leap-cross-window)", { silent = true })

vim.keymap.set("n", "s", leap_bidirectional, { silent = true })
