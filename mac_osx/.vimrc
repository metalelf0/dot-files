set t_Co=256
set nocompatible
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

" make rvm happy
set shell=/bin/sh

" rvm ruby configuration
" let g:ruby_path="/Users/metalelf0/.rvm/bin/ruby"

nnoremap tc  :tabnew<CR>
nnoremap td  :tabclose<CR>

" Show (partial) command in the status line
set showcmd

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" Include user's local vim config
if filereadable(expand("~/Dropbox/vim.local/macros.rc"))
  source ~/Dropbox/vim.local/macros.rc
endif

function! NeatFoldText() "{{{2
  let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
  let lines_count = v:foldend - v:foldstart + 1
  let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
  let foldchar = matchstr(&fillchars, 'fold:\zs.')
  let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
  let foldtextend = lines_count_text . repeat(foldchar, 8)
  let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
  return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endfunction
set foldtext=NeatFoldText()
" }}}2

" load the plugin and indent settings for the detected filetype
filetype plugin indent on

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" make uses real tabs
au FileType make set noexpandtab

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby

" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

" double tap esc to clear highlighting after search
nnoremap <silent> <Esc><Esc> :nohlsearch<CR>

" :w!! saves a file as root
cmap w!! w !sudo tee % >/dev/null
cmap W call RetabAndSave()

function RetabAndSave()
  %s/\s\+$//e
  retab
  w
endfunction

function DeleteRubyComments()
  g/#.*$/d
endfunction

nmap <silent> <Leader>dc call DeleteRubyComments()


" Use modeline overrides
set modeline
set modelines=10

" Directories for swp files
set backupdir=~/.vim_backup
set directory=~/.vim_backup

" MacVIM shift+arrow-keys behavior (required in .vimrc)
let macvim_hig_shift_movement = 1

" plugin configuration {{{1

" NERDTree configuration
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$']
map <Leader><Leader> :NERDTreeToggle<CR>
map <Leader>f :NERDTreeFind<CR>

" NERDCommenter configuration
" add extra spaces around delimiters
let NERDSpaceDelims=1

let g:vroom_detect_spec_helper=1

function VroomUseRspec1x()
  let g:vroom_rspec_version="1.x"
  let g:vroom_spec_command="spec "
endfunction

function VroomUseRspec2x()
  let g:vroom_rspec_version="2.x"
  let g:vroom_spec_command="rspec "
endfunction

" gist-vim defaults
if has("mac")
  let g:gist_clip_command = 'pbcopy'
elseif has("unix")
  let g:gist_clip_command = 'xclip -selection clipboard'
endif
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

"" YouCompleteMe
let g:ycm_key_list_previous_completion=['<Up>']

"" Ultisnips
let g:UltiSnipsExpandTrigger="<c-tab>"
let g:UltiSnipsListSnippets="<c-s-tab>"
" }}}1

" CTags
noremap <Leader>rt :!ctags --extra=+f -R *<CR><CR>
noremap <C-\> :tnext<CR>


" % to bounce from do to end etc.
runtime! macros/matchit.vim

" Use the silver searcher when available
if executable("ag")
  let g:ackprg = 'ag --nogroup --nocolor --column'
endif

let @l='Hilet(:WbEa)f=r{A }jH'
let g:ctrlp_working_path_mode = 0

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

 " let Vundle manage Vundle
 " required!
  Bundle 'gmarik/vundle'
  " Bundle 'ervandew/supertab.git'
  Bundle 'Valloric/YouCompleteMe'
  Bundle 'julienXX/Hemisu'
  Bundle 'metalelf0/Smyck-Color-Scheme.git'
  Bundle 'metalelf0/vimt0d0.git'
  Bundle 'mileszs/ack.vim.git'
  Bundle 'scrooloose/nerdcommenter.git'
  Bundle 'scrooloose/nerdtree.git'
  Bundle 'scrooloose/syntastic.git'
  Bundle 'tpope/vim-fugitive.git'
  Bundle 'tpope/vim-markdown.git'
  Bundle 'tpope/vim-rails.git'
  Bundle 'tpope/vim-surround.git'
  Bundle 'tpope/vim-dispatch'
  Bundle 'tpope/vim-rvm'
  Bundle 'vim-ruby/vim-ruby.git'
  Bundle 'vim-scripts/blackboard.vim'
  Bundle 'chriskempson/base16-vim'
  Bundle 'mattn/gist-vim'
  Bundle 'vim-scripts/Align'
  Bundle 'vim-scripts/bufexplorer.zip'
  Bundle 'vim-scripts/vim-indent-object'
  Bundle 'vim-scripts/mayansmoke'
  Bundle 'jaromero/vim-monokai-refined'
  Bundle 'dhruvasagar/vim-railscasts-theme'
  Bundle 'molok/vim-vombato-colorscheme'
  Bundle 'ujihisa/tabpagecolorscheme'
  Bundle 'rking/vim-ruby-refactoring'
  Bundle 'skwp/vim-rspec'
  Bundle 'kien/ctrlp.vim'
  Bundle 'skalnik/vim-vroom'
  Bundle 'Valloric/vim-valloric-colorscheme'

" drastic remaps!
noremap H ^
noremap L $
inoremap kj <Esc>


 filetype plugin indent on     " required!
 set foldlevelstart=20

let g:molokai_original=0
color molokai

so passwords.vim
