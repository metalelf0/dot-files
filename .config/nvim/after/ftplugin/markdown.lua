vim.opt.conceallevel = 3

vim.cmd([[
  nnoremap <buffer> <Leader><Enter> :norm 0<CR>:.s/\[ ]/\[x]/g<CR>:.s/$/ ✔ /g<CR>:.s/$/\=strftime("%Y-%m-%d")/g<CR>:nohl<CR>
  nnoremap <buffer> <Leader>w :norm 0<CR>:.s/\[ ]/\[ ] 🚧️/g<CR>:nohl<CR>

  function! s:setWindowOptions()
    call win_set_option(winnr(), 'wrap', v:false)
  endfunction

  augroup markdown_filetype_plugin
    autocmd!
    autocmd FileType markdown call s:setWindowOptions()
  augroup END
]])
