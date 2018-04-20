" Lightline
let g:lightline = {
      \ 'colorscheme': 'molokai',
      \ 'active': {
      \   'right': [ [ 'percent' ],
      \              [ 'filetype' ],
      \              [ 'linter_warnings', 'linter_errors', 'linter_ok'] ],
      \   'left': [ [ 'mode', 'paste' ],
      \              ['gitbranch', 'filename', 'modified', 'cutpoint' ] ]
      \ },
      \   'tabline': {
      \     'left': [ [ 'tabs' ] ],
      \     'right': [ [ 'close' ] ]
      \   },
      \   'tab': {
      \     'active': [ 'tabnum', 'filename', 'modified' ],
      \     'inactive': [ 'tabnum', 'filename', 'modified' ]
      \ },
      \ 'component': {
      \   'cutpoint': '%<'
      \ },
      \ 'component_function': {
      \   'gitbranch': 'GitBranch',
      \   'filetype': 'SignFiletype',
      \   'fileformat': 'SignFileformat',
      \ },
      \ 'component_expand': {
      \   'linter_warnings': 'LightlineLinterWarnings',
      \   'linter_errors': 'LightlineLinterErrors',
      \   'linter_ok': 'LightlineLinterOK'
      \ },
      \ 'component_type': {
      \   'readonly': 'error',
      \   'linter_warnings': 'warning',
      \   'linter_errors': 'error'
      \ },
      \'mode_map': {
      \   'n': '! ', 'i': '! ', 'R': ' ', 'v': '! ', 'V': '| ', "\<C-v>": ': ',
      \   'c': '! ', 's': 'se', 'S': 'sl', "\<C-s>": 'sl', 't': '! '
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' },
      \ }

function! GitBranch() abort
    return ' ' . fugitive#head()
endfunction

function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf(' %d', all_non_errors)
endfunction

function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf(' %d', all_errors)
endfunction

function! LightlineLinterOK() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? ' ' : ''
endfunction

function! SignFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! SignFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction
