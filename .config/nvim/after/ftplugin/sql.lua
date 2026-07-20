vim.fn.setreg("q", vim.api.nvim_replace_termcodes([[Vy:DB g:database <C-r>"<CR>]], true, true, true))
