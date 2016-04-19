" $HOME/.config/nvim/init.vim
set t_Co=256
set nocompatible
set number
set ruler
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
set list
set nobackup
set backupdir=~/.vim_backup
set directory=~/.vim_backup
set hidden
set diffopt=filler,vertical,iwhite
syntax sync minlines=256

let mapleader = "\<Space>"
let g:python3_host_prog='/usr/local/bin/python3'
" set clipboard+=unnamed


set rtp+=~/.fzf
call plug#begin('~/.config/nvim/plugged')
 Plug 'Raimondi/delimitMate'
 " Plug 'airblade/vim-gitgutter'
 Plug 'ap/vim-css-color'
 Plug 'vim-airline/vim-airline'
 Plug 'vim-airline/vim-airline-themes'
 " Plug 'christoomey/vim-tmux-navigator'
 " Plug 'itchyny/lightline.vim'
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
 " Plug 'ctrlpvim/ctrlp.vim'
 Plug 'kassio/neoterm'
 Plug 'kchmck/vim-coffee-script'
 Plug 'metalelf0/vimt0d0'
 Plug 'mtscout6/vim-cjsx'
 Plug 'mustache/vim-mustache-handlebars'
 Plug 'plasticboy/vim-markdown'
 Plug 'scrooloose/nerdcommenter'
 " Plug 'Shougo/unite.vim'
 " Plug 'Shougo/vimproc.vim', { 'do': 'make' }
 " Plug 'Shougo/deoplete.nvim'
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

 " directory editor - one of these should be fine!
 Plug 'tpope/vim-vinegar'
 " Plug 'justinmk/vim-dirvish'

 Plug 'tpope/vim-speeddating'
 Plug 'vim-ruby/vim-ruby'
 Plug 'jiajiawang/vim-ruby-helper'
 Plug 'ecomba/vim-ruby-refactoring'
 Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }
 " Plug 'ajh17/VimCompletesMe'
 Plug 'vim-scripts/ScrollColors'
 Plug 'wellle/targets.vim'
 Plug 'sickill/vim-pasta'
 Plug 't9md/vim-ruby-xmpfilter'
 Plug 'benekastah/neomake'
 Plug 'metalelf0/todo.txt-vim'
 Plug 'Glench/Vim-Jinja2-Syntax'
 " Plug 'easymotion/vim-easymotion'
 Plug 'terryma/vim-expand-region'
 Plug 'michaeljsmith/vim-indent-object'
 Plug 'jceb/vim-orgmode'
 " Plug 'scrooloose/nerdtree'
 "colors
  Plug 'AlessandroYorba/Alduin'
  Plug 'AlessandroYorba/Sierra'
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'abra/vim-abra'
  Plug 'acarapetis/vim-colors-github'
  Plug 'ajh17/Spacegray.vim'
  Plug 'altercation/vim-colors-solarized'
  Plug 'baskerville/bubblegum'
  Plug 'chriskempson/vim-tomorrow-theme'
  Plug 'dylanaraps/crayon'
  Plug 'ewilazarus/preto'
  Plug 'freeo/vim-kalisi'
  Plug 'fxn/vim-monochrome'
  Plug 'gmoe/vim-espresso'
  Plug 'ifightcrime/Muon'
  Plug 'jonathanfilip/vim-lucius'
  Plug 'julienxx/hemisu'
  Plug 'junegunn/seoul256.vim'
  Plug 'kokakolako/vim-hemisu-airline'
  Plug 'marcopaganini/termschool-vim-theme'
  Plug 'mhartington/oceanic-next'
  Plug 'mhinz/vim-janah'
  Plug 'mkarmona/colorsbox'
  Plug 'morhetz/gruvbox'
  Plug 'mswift42/vim-themes'
  Plug 'nanotech/jellybeans.vim'
  Plug 'petelewis/vim-evolution'
  Plug 'petelewis/vim-evolution'
  Plug 'romainl/Apprentice'
  Plug 'romainl/flattened'
  Plug 'sheerun/vim-wombat-scheme'
  Plug 'sts10/vim-mustard'
  Plug 'thriveth/vim-twilight-bright'
  Plug 'twerth/ir_black'
  Plug 'whatyouhide/vim-gotham'
  Plug 'zenorocha/dracula-theme', { 'rtp': 'vim' }
  Plug 'jdkanani/vim-material-theme'
  Plug 'tomasr/molokai'
 call plug#end()

" source $HOME/.config/nvim/setup/ctrlp.vim
" source $HOME/.config/nvim/setup/deoplete.nvim
" source $HOME/.config/nvim/setup/easymotion.vim
" source $HOME/.config/nvim/setup/unite.vim
source $HOME/.config/nvim/setup/airline.vim
source $HOME/.config/nvim/setup/color-alduin.vim
source $HOME/.config/nvim/setup/ctrlsf.vim
source $HOME/.config/nvim/setup/easyalign.vim
source $HOME/.config/nvim/setup/file-open-mappings.vim
source $HOME/.config/nvim/setup/folding.vim
source $HOME/.config/nvim/setup/functions.vim
source $HOME/.config/nvim/setup/fzf.vim
source $HOME/.config/nvim/setup/neomake.nvim
source $HOME/.config/nvim/setup/neoterm.vim
source $HOME/.config/nvim/setup/nerdcommenter.vim
source $HOME/.config/nvim/setup/oblique.vim
source $HOME/.config/nvim/setup/rails-autocommands.nvim
source $HOME/.config/nvim/setup/sneak.vim
source $HOME/.config/nvim/setup/supertab.vim
source $HOME/.config/nvim/setup/syntax_coffee.vim
source $HOME/.config/nvim/setup/syntax_markdown.vim
source $HOME/.config/nvim/setup/ultisnips.vim
source $HOME/.config/nvim/setup/vim-expand-region.nvim
source $HOME/.config/nvim/setup/xmpfilter.vim
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

" useful macros
let @n='zRGy17kggP<Esc>:read !date "+\%B \%d, \%A"'
let @d=':read !date "+\%B \%d, \%A"'

let colors = [ 'PaperColor', 'crayon', 'oceanicnext', 'gruvbox', 'solarized', 'hemisu', 'apprentice', 'jellybeans', 'wombat', 'monochrome', 'alduin', 'sierra' ]
if $ITERM_PROFILE != ""
  if index(colors, $ITERM_PROFILE) != -1
    color $ITERM_PROFILE
    source $HOME/.config/nvim/setup/color-$ITERM_PROFILE.vim
  elseif index(colors, substitute($ITERM_PROFILE, '-dark\|-light', '', '')) != -1
    let baseColor = substitute($ITERM_PROFILE, '-dark\|-light', '', '')
    let variant   = substitute($ITERM_PROFILE, baseColor . '-', '', '')
    exe "color ".baseColor
    exe "set bg=".variant
    source $HOME/.config/nvim/setup/color-$ITERM_PROFILE.vim
  endif
else
  color apprentice
  source $HOME/.config/nvim/setup/color-apprentice.vim
endif

augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
  augroup END


" no colorcolumn, please
set colorcolumn=
