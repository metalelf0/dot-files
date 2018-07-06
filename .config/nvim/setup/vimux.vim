 function! VimuxSlime()
  call VimuxOpenRunner()
  call VimuxSendText(@t)
  call VimuxSendKeys("Enter")
 endfunction

 " If text is selected, save it in the t buffer and send that buffer it to tmux
 vmap <LocalLeader>tt "ty :call VimuxSlime()<Enter>

 " Select current paragraph and send it to tmux
 nmap <LocalLeader>tt vip<LocalLeader>vs<Enter>

function! VimuxCreateNewPane()
  " Creates new Tmux pane
  let splitExitCode = system("tmux split-window")
  " Set the proper index
  let g:VimuxRunnerIndex = _VimuxTmuxIndex()
  call _VimuxTmux("last-"._VimuxRunnerType())
endfunction
