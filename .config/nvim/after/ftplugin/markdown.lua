vim.opt.conceallevel = 2

vim.cmd([[
  function! s:setWindowOptions()
    call win_set_option(winnr(), 'wrap', v:false)
  endfunction

  augroup markdown_filetype_plugin
    autocmd!
    autocmd FileType markdown call s:setWindowOptions()
  augroup END
]])
