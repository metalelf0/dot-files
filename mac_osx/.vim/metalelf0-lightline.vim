" --------------------------------------------------------------
" dphase lightline.vim settings
" --------------------------------------------------------------

let g:lightline = {
      \ 'colorscheme': 'default',
      \ 'mode_map': {
      \   'n': '⌘',
      \   'i': 'λ',
      \   'v': '═',
      \   'V': '≡',
      \   'R': '✗'
      \ },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste', 'readonly' ], [ 'fugitive'], ['filename' ], [ 'modified', 'ctrlpmark' ] ],
      \   'right': [ [ 'syntastic', 'lineinfo' ], ['percent'], [ 'fileformat', 'filetype' ] ]
      \ },
      \ 'inactive': {
      \   'left': [ ['mode'], ['fugitive', 'filename', 'modified'] ],
      \   'right': [ ],
      \ },
      \ 'component_function': {
      \   'fugitive': 'MyFugitive',
      \   'fileformat': 'MyFileformat',
      \   'filetype': 'MyFiletype',
      \   'fileencoding': 'MyFileencoding',
      \   'mode': 'MyMode',
      \   'ctrlpmark': 'CtrlPMark',
      \   'filename': 'MyFilename'
      \ },
      \ 'component_expand': {
      \   'percent': 'MyPercent',
      \   'modified': 'JDModified',
      \   'readonly': 'MyReadonly',
      \   'syntastic': 'SyntasticStatuslineFlag',
      \   'lineinfo': 'MyLineInfo'
      \ },
      \ 'component_type': {
      \   'syntastic': 'error',
      \   'readonly': 'readonly',
      \   'modified': 'modified'
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '■' : &modifiable ? '' : ''
endfunction

function! JDModified()
  return '%{&filetype =~ "help\|vimfiler\|gundo\|nerdtree\|ctrlp\|no ft" ? "" : &modified ? "■" : &modifiable? "" : ""}'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '⭤' : ''
endfunction

function! MyFilename()
  let fname = substitute(expand('%'), '.*/\([^/]\+/\)', '\1', '')
  return fname == 'ControlP' ? g:lightline.ctrlp_item :
        \ fname == '__Tagbar__' ? g:lightline.fname :
        \ fname =~ '__Gundo\|NERD_tree' ? '' :
        \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
        \ &ft == 'unite' ? unite#get_status_string() :
        \ &ft == 'vimshell' ? vimshell#get_status_string() :
        \ ('' != fname ? fname : '[No Name]')
endfunction

function! MyFugitive()
  try
    if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
      let _ = fugitive#head()
      return strlen(_) ? '⭠ '._ : ''
    endif
  catch
  endtry
  return ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyPercent()
  let percent = '⇅%3p%%'
  let my_percent = &ft == 'vimshell' ? '❮❮' :
        \ ('' != percent ? percent : '')
  return winwidth(0) > 60 ? my_percent : ' '
endfunction

function! MyLineInfo()
  " let lineinfo = ' %3l:%-2v'
  let lineinfo = '⭡ %3l:%-2v'
  return winwidth(0) > 60 ? lineinfo : ''
endfunction

function! MyMode()
  let fname = expand('%:t')
  return fname == '__Tagbar__' ? 'Tagbar' :
        \ fname == 'ControlP' ? 'CtrlP' :
        \ fname == '__Gundo__' ? 'Gundo' :
        \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
        \ fname =~ 'NERD_tree' ? 'NERDTree' :
        \ &ft == 'unite' ? 'Unite' :
        \ &ft == 'vimfiler' ? 'VimFiler' :
        \ &ft == 'vimshell' ? 'VimShell' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! CtrlPMark()
  if expand('%:t') =~ 'ControlP'
    call lightline#link('iR'[g:lightline.ctrlp_regex])
    return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
          \ , g:lightline.ctrlp_next], 0)
  else
    return ''
  endif
endfunction

let g:ctrlp_status_func = {
  \ 'main': 'CtrlPStatusFunc_1',
  \ 'prog': 'CtrlPStatusFunc_2',
  \ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
  return lightline#statusline(0)
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
    let g:lightline.fname = a:fname
  return lightline#statusline(0)
endfunction

augroup AutoSyntastic
  autocmd!
  autocmd BufWritePost *.rb,*.c,*.cpp call s:syntastic()
augroup END
function! s:syntastic()
  SyntasticCheck
  call lightline#update()
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0

