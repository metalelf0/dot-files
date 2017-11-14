 function! VimuxSlime()
  call VimuxSendText(@v)
  call VimuxSendKeys("Enter")
 endfunction

 " If text is selected, save it in the v buffer and send that buffer it to tmux
 vmap <LocalLeader>vs "vy :call VimuxSlime()<CR>

 " Select current paragraph and send it to tmux
 nmap <LocalLeader>vs vip<LocalLeader>vs<CR>
