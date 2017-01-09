" let g:airline_theme = 'hemisu_airline'
" let g:airline_theme='gruvbox'
" let g:airline_theme='papercolor'
" let g:airline_theme='jellybeans'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1

" " airline customization
" function! AddPomoToAirline(ext)
  " call a:ext.add_statusline_funcref(function('AddPomo'))
" endfunction

" function! AddPomo(...)
  " let w:airline_section_c = get(w:, 'airline_section_c', g:airline_section_c)
  " let w:airline_section_c .= g:airline_left_sep . ' %{PomodoroStatus()}'
" endfunction

let g:airline#extensions#branch#enabled=0
