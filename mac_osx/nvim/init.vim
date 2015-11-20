" $HOME/.config/nvim/init.vim
set t_Co=256
set nocompatible
set number
set ruler
syntax on
set encoding=utf-8
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set hlsearch
set incsearch
set ignorecase
set smartcase
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*
set laststatus=2
set autoindent
set autoread
set notimeout
set nottimeout
set ttimeoutlen=10
set synmaxcol=500
set relativenumber
set number
set complete=.,b,u,]
set wildmode=longest,list:longest,list:full
set completeopt=menu,preview
set backspace=indent,eol,start
set wrap
set linebreak
set nolist
set nobackup
set backupdir=~/.vim_backup
set directory=~/.vim_backup
set hidden
set diffopt=filler,vertical,iwhite
syntax sync minlines=256

let mapleader = "\<Space>"
" set clipboard+=unnamed


filetype plugin indent on


set rtp+=~/.fzf
 call plug#begin('~/.config/nvim/plugged')
 Plug 'Raimondi/delimitMate'
 Plug 'airblade/vim-gitgutter'
 Plug 'ap/vim-css-color'
 Plug 'bling/vim-airline'
 " Plug 'christoomey/vim-tmux-navigator'
 Plug 'dyng/ctrlsf.vim'
 Plug 'ervandew/supertab'
 Plug 'honza/vim-snippets'
 Plug 'jtratner/vim-flavored-markdown'
 Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
 Plug 'junegunn/fzf.vim'
 Plug 'junegunn/vim-easy-align'
 Plug 'junegunn/vim-oblique'
 Plug 'junegunn/vim-pseudocl'
 Plug 'justinmk/vim-sneak'
 Plug 'kchmck/vim-coffee-script'
 Plug 'metalelf0/vimt0d0'
 Plug 'mtscout6/vim-cjsx'
 Plug 'mustache/vim-mustache-handlebars'
 Plug 'plasticboy/vim-markdown'
 Plug 'scrooloose/nerdcommenter'
 " Plug 'Shougo/unite.vim'
 " Plug 'Shougo/vimproc.vim', { 'do': 'make' }
 Plug 'sirver/ultisnips'
 Plug 'terryma/vim-multiple-cursors'
 Plug 'tpope/vim-dispatch'
 Plug 'tpope/vim-eunuch'
 Plug 'tpope/vim-fugitive'
 Plug 'tpope/vim-rails'
 Plug 'tpope/vim-rsi'
 Plug 'tpope/vim-rvm'
 Plug 'tpope/vim-surround'
 Plug 'tpope/vim-unimpaired'
 Plug 'tpope/vim-vinegar'
 Plug 'vim-ruby/vim-ruby'
 Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }
 Plug 'vim-scripts/ScrollColors'
 Plug 'wellle/targets.vim'
 "colors
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'dylanaraps/crayon'
  Plug 'mhartington/oceanic-next'
  Plug 'morhetz/gruvbox'
  Plug 'altercation/vim-colors-solarized'
  Plug 'julienxx/hemisu'
  Plug 'kokakolako/vim-hemisu-airline'
  Plug 'romainl/Apprentice'
  Plug 'nanotech/jellybeans.vim'
  Plug 'baskerville/bubblegum'
  Plug 'zenorocha/dracula-theme', { 'rtp': 'vim' }
  Plug 'junegunn/seoul256.vim'
  Plug 'abra/vim-abra'
  Plug 'sheerun/vim-wombat-scheme'
 call plug#end()

source $HOME/.config/nvim/setup/file-open-mappings.vim
source $HOME/.config/nvim/setup/oblique.vim
source $HOME/.config/nvim/setup/easyalign.vim
source $HOME/.config/nvim/setup/nerdcommenter.vim
source $HOME/.config/nvim/setup/fzf.vim
source $HOME/.config/nvim/setup/airline.vim
source $HOME/.config/nvim/setup/neoterm.vim
source $HOME/.config/nvim/setup/syntax_coffee.vim
source $HOME/.config/nvim/setup/syntax_markdown.vim
source $HOME/.config/nvim/setup/ctrlsf.vim
source $HOME/.config/nvim/setup/folding.vim
source $HOME/.config/nvim/setup/functions.vim
" source $HOME/.config/nvim/setup/unite.vim
source $HOME/.config/nvim/setup/ultisnips.vim
" source $HOME/.config/nvim/setup/leader-key-window-navigation.vim

" mappings
map <Leader>tt :tabnew<Enter>
cmap w!! w !sudo tee % >/dev/null
noremap H ^
noremap L $
inoremap kj <Esc>
map gb :bn<Enter>
map gB :bN<Enter>
noremap <C-j> :bn<Enter>
noremap <C-k> :bp<Enter>
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'
tnoremap <Esc> <c-\><c-n>
nnoremap <silent> <Esc><Esc> :nohlsearch<CR>

let colors = [ 'PaperColor', 'crayon', 'oceanicnext', 'gruvbox', 'solarized', 'hemisu', 'apprentice', 'jellybeans', 'wombat' ]
if $ITERM_PROFILE != "" && index(colors, $ITERM_PROFILE) != -1
  color $ITERM_PROFILE
  source $HOME/.config/nvim/setup/color-$ITERM_PROFILE.vim
else
  color apprentice
  source $HOME/.config/nvim/setup/color-apprentice.vim
endif
