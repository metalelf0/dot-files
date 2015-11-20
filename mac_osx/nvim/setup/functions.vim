function! TrimWhiteSpace()
  %s/\s\+$//
endfunction
command! -bar TrimWhiteSpace call TrimWhiteSpace()
