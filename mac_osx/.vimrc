set t_Co=256
set nocompatible
"call pathogen#runtime_append_all_bundles()
"call pathogen#helptags()
set number
set ruler
syntax on
set encoding=utf-8
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set list listchars=tab:\ \ ,trail:·
set hlsearch
set incsearch
set ignorecase
set smartcase
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*
set laststatus=2

" Without setting this, ZoomWin restores windows in a way that causes
" equalalways behavior to be triggered the next time CommandT is used.
" This is likely a bludgeon to solve some other issue, but it works
set noequalalways

" NERDTree configuration
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$']
map <Leader><Leader> :NERDTreeToggle<CR>
map <Leader>f :NERDTreeFind<CR>

" Command-T configuration
let g:CommandTMaxHeight=20

" CTags
noremap <Leader>rt :!ctags --extra=+f -R *<CR><CR>
noremap <C-\> :tnext<CR>

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

function s:setupWrapping()
  set wrap
  set wrapmargin=2
  set textwidth=72
endfunction

function s:setupMarkup()
  call s:setupWrapping()
  noremap <buffer> <Leader>p :Hammer<CR>
endfunction

" load the plugin and indent settings for the detected filetype
filetype plugin indent on

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" make uses real tabs
au FileType make set noexpandtab

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby

" md, markdown, and mk are markdown and define buffer-local preview
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()

" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

au BufRead,BufNewFile *.txt call s:setupWrapping()

" make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79

" double tap esc to clear highlighting after search
nnoremap <silent> <Esc><Esc> :nohlsearch<CR>

" Leader c to change word case
nnoremap <Leader>c viw~

" :w!! saves a file as root
cmap w!! w !sudo tee % >/dev/null
cmap W call RetabAndSave()

function RetabAndSave()
  %s/\s\+$//e
  retab
  w
endfunction


" Unimpaired configuration
" Bubble single lines
nnoremap <C-Up> [e
nnoremap <C-Down> ]e
" Bubble multiple lines
vnoremap <C-Up> [egv
vnoremap <C-Down> ]egv

" - moves one line down
noremap - ddp
" _ moves one line up
noremap _ ddkkp

" Enable syntastic syntax checking
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1

" gist-vim defaults
if has("mac")
  let g:gist_clip_command = 'pbcopy'
elseif has("unix")
  let g:gist_clip_command = 'xclip -selection clipboard'
endif
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

let g:github_user="metalelf0"
let g:github_token="73f78c03a891246e6d1657c839e3ea6b"

" Use modeline overrides
set modeline
set modelines=10

" Default color scheme
"color lucius
color smyck
"color codeschool-skia
"color smyck 
"color rootwater
let g:solarized_termcolors = 256
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"

" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" Turn off jslint errors by default
let g:JSLintHighlightErrorLine = 0

" MacVIM shift+arrow-keys behavior (required in .vimrc)
let macvim_hig_shift_movement = 1

" % to bounce from do to end etc.
runtime! macros/matchit.vim

" Show (partial) command in the status line
set showcmd

" Include user's local vim config
if filereadable(expand("~/Dropbox/.vimrc.local"))
  source ~/Dropbox/.vimrc.local
endif

" Include user's local vim config
if filereadable(expand("~/Dropbox/vim.local/macros.rc"))
  source ~/Dropbox/vim.local/macros.rc
endif

function ListTodos()
  noautocmd vimgrep /#TODO/j **/*
  cw
endfunction

function ReindentHtml()
  execute "set ft=html<cr>set si<cr>gg=G<cr>"
endfunction

" drastic remaps!
noremap H ^
noremap L $
inoremap kj <Esc>

" C-s for save
noremap <C-s> <esc>:w<CR>
inoremap <C-s> <esc>:w<CR>

let @l='Hilet(:WbEa)f=r{A }jH^M'

" CtrlP settings
let g:ctrlp_working_path_mode = 0

set rtp+=~/.vim/bundle/vundle/
 call vundle#rc()

 " let Vundle manage Vundle
 " required! 
 Bundle 'gmarik/vundle'

 " My Bundles here:
 "
  Bundle 'aerosol/vim-compot.git'
  Bundle 'bbommarito/vim-slim'
  Bundle 'ervandew/supertab.git'
  Bundle 'jgdavey/tslime.vim.git'
  Bundle 'julienXX/Hemisu'
  Bundle 'kchmck/vim-coffee-script.git'
  Bundle 'kien/ctrlp.vim.git'
  Bundle 'metalelf0/Hemisu'
  Bundle 'metalelf0/vim-vroom.git'
  Bundle 'metalelf0/vimt0d0.git'
  Bundle 'mileszs/ack.vim.git'
  Bundle 'nathanaelkane/vim-indent-guides.git'
  Bundle 'niklasl/vimheap'
  Bundle 'programble/itchy.vim.git'
  Bundle 'scrooloose/nerdcommenter.git'
  Bundle 'scrooloose/nerdtree.git'
  Bundle 'scrooloose/syntastic.git'
  Bundle 'sjl/badwolf.git'
  Bundle 'tpope/vim-abolish.git'
  Bundle 'tpope/vim-fugitive.git'
  Bundle 'tpope/vim-markdown.git'
  Bundle 'tpope/vim-rails.git'
  Bundle 'tpope/vim-surround.git'
  Bundle 'vim-ruby/vim-ruby.git'
  Bundle 'vim-scripts/blackboard.vim'
  Bundle 'vim-scripts/vim-json-bundle'
  Bundle 'bingaman/vim-sparkup.git'
  Bundle 'tpope/vim-bundler.git'
  Bundle 'chriskempson/base16-vim'

 filetype plugin indent on     " required!
