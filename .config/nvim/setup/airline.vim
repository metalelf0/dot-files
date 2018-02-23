let g:airline_powerline_fonts=0

" if exists("g:GuiLoaded")
  " let g:airline_powerline_fonts=0
" else
  " let g:airline_powerline_fonts=1
" endif

" let g:airline#extensions#tabline#enabled = 1

" " airline customization
" function! AddPomoToAirline(ext)
  " call a:ext.add_statusline_funcref(function('AddPomo'))
" endfunction

" function! AddPomo(...)
  " let w:airline_section_c = get(w:, 'airline_section_c', g:airline_section_c)
  " let w:airline_section_c .= g:airline_left_sep . ' %{PomodoroStatus()}'
" endfunction

let g:airline#extensions#branch#enabled=0
