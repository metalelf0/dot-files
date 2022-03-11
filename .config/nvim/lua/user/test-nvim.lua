local tt = require "toggleterm"
local ttt = require "toggleterm.terminal"

vim.g["test#custom_strategies"] = {
  tterm = function(cmd)
    tt.exec(cmd)
  end,

  tterm_close = function(cmd)
    local term_id = 0
    tt.exec(cmd, term_id)
    ttt.get_or_create_term(term_id):close()
  end,
}

vim.g["test#strategy"] = "tterm"
