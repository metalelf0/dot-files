" vim: tw=70 fdm=marker fdl=0 fen

" options and default stuff {{{1
set nocompatible
set number
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set smarttab
set ignorecase
set smartcase
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*
set laststatus=2
set notimeout
set nottimeout
set ttimeoutlen=10
set synmaxcol=500
set norelativenumber
set number
set wildmode=longest,list:longest,list:full
set completeopt=menu,preview
set backspace=indent,eol,start
set wrap
set linebreak
set nobackup
set backupdir=~/.vim_backup
set directory=~/.vim_backup
set hidden
set diffopt=filler,vertical,iwhite
set scrolloff=5
let mapleader = "\<Space>"
let maplocalleader = "_"
let g:python3_host_prog='/usr/local/bin/python3'
set clipboard^=unnamedplus
set inccommand=split
set termguicolors
set gdefault
set equalalways

set listchars=tab:│\ ,extends:>,precedes:<,nbsp:%,trail:∙
set list
set fillchars=vert:│,fold:─
let false = 0
let true = !false
let gui = has('gui_running') ? true : false

" Load vim-plug {{{1
if empty(glob("~/.config/nvim/autoload/plug.vim"))
    execute '!mkdir -p ~/.config/nvim/autoload'
    execute '!curl -fLo ~/.config/nvim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

" vim-plug plugins {{{1

call plug#begin('~/.config/nvim/plugged')
" plugins {{{2
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'benmills/vimux'
Plug 'janko-m/vim-test'
Plug 'jreybert/vimagit'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'kchmck/vim-coffee-script', { 'for': ['coffee'] }
Plug 'ludovicchabant/vim-gutentags'
Plug 'mhinz/vim-signify'
Plug 'michaeljsmith/vim-indent-object'
Plug 'ncm2/ncm2'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails', { 'for': ['ruby', 'eruby'] }
Plug 'tpope/vim-rbenv', { 'for': ['ruby', 'eruby'] }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'w0rp/ale'
Plug 'itchyny/lightline.vim'
" colorschemes {{{2
Plug 'cocopon/iceberg.vim'
Plug 'jacoborus/tender.vim'
Plug 'NerdyPepper/vim-colors-plain'
Plug 'metalelf0/apprentice'
Plug 'morhetz/gruvbox'
Plug 'w0ng/vim-hybrid'
Plug 'fcpg/vim-fahrenheit'
Plug 'arcticicestudio/nord-vim'
Plug 'nanotech/jellybeans.vim'
Plug 'joshdick/onedark.vim'
Plug 'rakr/vim-one'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'liuchengxu/space-vim-dark'
Plug 'owickstrom/vim-colors-paramount'
call plug#end()

" Plugin configurations {{{1
" NERDCommenter {{{2
" add extra spaces around delimiters
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'

" vim-test {{{2
nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
" nmap <silent> <leader>ts :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tv :TestVisit<CR>
let test#strategy="vimux"

" FZF {{{2
set rtp+=~/.fzf

let g:fzf_nvim_statusline = 0 " disable statusline overwriting
let g:fzf_layout = { 'window': 'enew' } " same window, please
let $FZF_DEFAULT_COMMAND = 'ag -l --ignore "node_modules" -g ""'
nnoremap <c-p> :FZF<cr>

nnoremap <silent> <leader>p :Files<CR>
nnoremap <silent> <leader>B :Buffers<CR>
nnoremap <silent> <leader>; :BLines<CR>
nnoremap <silent> <leader>. :Lines<CR>
nnoremap <silent> <leader>o :BTags<CR>
nnoremap <silent> <leader>O :Tags<CR>
nnoremap <silent> <leader>: :Commands<CR>
nnoremap <silent> <leader>? :History<CR>
" nnoremap <silent> <leader>/ :execute 'Ag ' . input('Ag/')<CR>
nnoremap <silent> K :call SearchWordWithAg()<CR>
vnoremap <silent> K :call SearchVisualSelectionWithAg()<CR>
nnoremap <silent> <leader>gl :Commits<CR>
nnoremap <silent> <leader>ga :BCommits<CR>

imap <C-x><C-f> <plug>(fzf-complete-file-ag)
imap <C-x><C-l> <plug>(fzf-complete-line)

function! SearchWordWithAg()
  execute 'Rg' expand('<cword>')
endfunction

function! SearchVisualSelectionWithAg() range
  let old_reg = getreg('"')
  let old_regtype = getregtype('"')
  let old_clipboard = &clipboard
  set clipboard&
  normal! ""gvy
  let selection = getreg('"')
  call setreg('"', old_reg, old_regtype)
  let &clipboard = old_clipboard
  execute 'Rg' selection
endfunction

if has('nvim')
  tnoremap <a-a> <esc>a
  tnoremap <a-b> <esc>b
  tnoremap <a-d> <esc>d
  tnoremap <a-f> <esc>f
endif

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 2,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

nnoremap <silent> <leader>/ :execute 'Rg'<CR>

" EasyAlign {{{2
vmap <Enter> <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)

" Gutentags {{{2
let g:gutentags_define_advanced_commands = 1
let g:gutentags_ctags_exclude = [".git", "node_modules", "log", "vendor", "solr-7.3.0"]

" Lightline {{{2
let g:lightline = {
      \ 'colorscheme': 'onehalfdark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }
" mappings I like {{{1
cmap w!! w !sudo tee % >/dev/null
inoremap kj <Esc>
tnoremap <Esc> <c-\><c-n>
nnoremap <silent> <Esc><Esc> :nohlsearch<CR>
vmap <C-f> y0/<C-r>"<Enter>cgn
nnoremap <Leader>f viwy0/<C-r>"<Enter>cgn

" Show syntax highlighting groups for word under cursor
nmap <leader>z :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
" and some file-open-mappings {{{2
map <Leader>J :vsplit $HOME/Documents/journal.md<Enter>
map <Leader>N :vsplit $HOME/Documents/notes.md<Enter>
map <Leader>T :split $HOME/Documents/todo/todo.txt<Enter>
map <Leader>V :vsplit $MYVIMRC<Enter>
map <Leader>Z :vsplit $HOME/.zshrc<Enter>

" useful autocommands {{{1
" strip trailing whitespaces
autocmd BufWritePre *.erb,*.rb,*.rake,*.py,*.vim,*.css,*.js,*.html,*.cpp,*.c,*.java,*.go,*.rs,*.ts,*.cljs,*.clj :%s/\s\+$//e
" grepprg configuration {{{1

if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading
elseif executable('pt')
  set grepprg=pt\ --nogroup\ --nocolor\ --ignore-case
elseif executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
endif


" color and niceties {{{1
colo onehalfdark
