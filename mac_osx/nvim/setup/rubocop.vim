function! RubocopCurrentFile()
  if (filereadable(expand('%')) && "rb" == expand("%:e"))
    silent echo system('rubocop -a '.shellescape(expand('%')))
    edit
  else
    echo 'Not a valid ruby file: '.expand('%:e')
  endif
endfunction

command! RubocopCurrentFile call RubocopCurrentFile()
