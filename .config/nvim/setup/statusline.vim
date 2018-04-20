" set statusline=
" set statusline+=%7*\[%n]                                  "buffernr
" set statusline+=%1*\ %<%F\                                "File+path
" set statusline+=%2*\ %y\                                  "FileType
" set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).''}      "Encoding
" set statusline+=%3*\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
" set statusline+=%4*\ %{&ff}\                              "FileFormat (dos/unix..) 
" set statusline+=%5*\ %{&spelllang}\%{HighlightSearch()}\  "Spellanguage & Highlight on?
" set statusline+=%8*\ %=\ row:%l/%L\ (%03p%%)\             "Rownumber/total (%)
" set statusline+=%9*\ col:%03c\                            "Colnr
" set statusline+=%0*\ \ %m%r%w\ %P\ \                      "Modified? Readonly? Top/bot.

" function! HighlightSearch()
"   if &hls
"     return 'H'
"   else
"     return ''
"   endif
" endfunction

" " Function: display errors from Ale in statusline
" function! LinterStatus() abort
"    let l:counts = ale#statusline#Count(bufnr(''))
"    let l:all_errors = l:counts.error + l:counts.style_error
"    let l:all_non_errors = l:counts.total - l:all_errors
"    return l:counts.total == 0 ? '' : printf(
"    \ 'W:%d E:%d',
"    \ l:all_non_errors,
"    \ l:all_errors
"    \)
" endfunction
" set laststatus=2
" set statusline=
" set statusline+=\ %l
" set statusline+=\ %*
" set statusline+=\ ‹‹
" set statusline+=\ %f\ %*
" set statusline+=\ ››
" set statusline+=\ %m
" set statusline+=\ %F
" set statusline+=%=
" set statusline+=\ %{LinterStatus()}
" set statusline+=\ ‹‹
" set statusline+=\ %{strftime('%R', getftime(expand('%')))}
" set statusline+=\ ::
" set statusline+=\ %n


function! Git_branch()
  let l:branch = fugitive#head()
  return empty(l:branch)?'':'['.l:branch.']'
endfunction

function! LinterStatus() abort
  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  return l:counts.total == 0 ? '' : printf(
        \   '%d⚠ %d⨉',
        \   all_non_errors,
        \   all_errors
        \)
endfunction set statusline+=\ ››\ %*

set statusline=""
set statusline+=%{Git_branch()}
set statusline+=\ "
" filename
set statusline+=%<%f
set statusline+=\ "
" help/modified/readonly
set statusline+=%h%m%r
" alignment group
set statusline+=%=
" start error highlight group
set statusline+=%#StatusLineError#
" errors from w0rp/ale
set statusline+=%{LinterStatus()}
" reset highlight group
set statusline+=%#StatusLine#
set statusline+=\ "
" line/total lines
set statusline+=L%l/%L
set statusline+=\ "
" virtual column
set statusline+=C%02v