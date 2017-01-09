" $HOME/.config/nvim/init.vim
set termguicolors
set t_Co=256
set nocompatible
set number
set ruler

" tabs
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set smarttab

set hlsearch
set incsearch
set ignorecase
set smartcase
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*
set laststatus=2
set autoread
set notimeout
set nottimeout
set ttimeoutlen=10
set synmaxcol=500
set relativenumber
set number
set complete=.,b,u,]
set completeopt-=preview
set completeopt+=noinsert,noselect
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

" used by deoplete
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

set rtp+=~/.fzf
call plug#begin('~/.config/nvim/plugged')
" Plug 'ctrlpvim/ctrlp.vim'
" Plug 'nazo/pt.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-sneak'
Plug 'metalelf0/todo.txt-vim'
Plug 'michaeljsmith/vim-indent-object'
Plug 'scrooloose/nerdcommenter'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-surround'
" vim-abolish: abbreviation / substitution / coercion
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-rbenv'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'wellle/targets.vim'
" Plug 'qpkorr/vim-bufkill'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'fishbullet/deoplete-ruby'
Plug 'ervandew/supertab'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'
" Plug 'wesQ3/vim-windowswap'
Plug 'w0rp/ale'
Plug 'christoomey/vim-conflicted'
Plug 'ludovicchabant/vim-gutentags'
Plug 'mhinz/vim-signify'
Plug 'vimwiki/vimwiki'
" Plug 'sheerun/vim-polyglot'
Plug 'metalelf0/vim-bbye'

" ruby
Plug 'osyo-manga/vim-monster', { 'for': ['ruby', 'eruby'] }
Plug 'tpope/vim-rbenv', { 'for': ['ruby', 'eruby'] }
Plug 'vim-ruby/vim-ruby', { 'for': ['ruby', 'eruby'] }
Plug 'tpope/vim-rails', { 'for': ['ruby', 'eruby'] }
Plug 'Keithbsmiley/rspec.vim', { 'for': ['ruby'] }
Plug 'sunaku/vim-ruby-minitest', { 'for': ['ruby'] }
Plug 'jiajiawang/vim-ruby-helper', { 'for': ['ruby'] }
Plug 'ecomba/vim-ruby-refactoring', { 'for': ['ruby'] }

" javascript
Plug 'othree/yajs.vim', { 'for': ['javascript'] }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript'] }
Plug 'moll/vim-node', { 'for': ['javascript'] }
Plug 'elzr/vim-json', { 'for': ['json', 'javascript'] }
Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }
Plug 'kchmck/vim-coffee-script', { 'for': ['coffee'] }

" markup
Plug 'othree/html5.vim', { 'for': ['html', 'javascript', 'eruby'] }
Plug 'hail2u/vim-css3-syntax', { 'for': ['html', 'css', 'eruby'] }
Plug 'plasticboy/vim-markdown', { 'for': ['mkd', 'markdown', 'mkd.markdown'] }
Plug 'cakebaker/scss-syntax.vim', { 'for': ['scss'] }
Plug 'tpope/vim-haml', { 'for': ['haml'] }

"colors
" Plug 'chriskempson/base16-vim'
Plug '29decibel/codeschool-vim-theme'
Plug 'AlessandroYorba/Alduin'
Plug 'AlessandroYorba/Despacio'
Plug 'AlessandroYorba/Sierra'
Plug 'Lokaltog/vim-distinguished'
Plug 'MaxSt/FlatColor'
Plug 'NLKNguyen/papercolor-theme'
Plug 'Soares/base16.nvim'
Plug 'abra/vim-obsidian'
Plug 'acarapetis/vim-colors-github'
Plug 'ajh17/Spacegray.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'baskerville/bubblegum'
Plug 'chase/focuspoint-vim'
Plug 'chriskempson/base16-vim'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'ciaranm/inkpot'
Plug 'djjcast/mirodark'
Plug 'dracula/vim'
Plug 'dylanaraps/ryuuko'
Plug 'ewilazarus/preto'
Plug 'fmoralesc/molokayo'
Plug 'freeo/vim-kalisi'
Plug 'fxn/vim-monochrome'
Plug 'gilgigilgil/anderson.vim'
Plug 'gmoe/vim-espresso'
Plug 'gregsexton/Atom'
Plug 'herrbischoff/cobalt2.vim'
Plug 'ifightcrime/Muon'
Plug 'jacoborus/tender.vim'
Plug 'jdkanani/vim-material-theme'
Plug 'jnurmine/Zenburn'
Plug 'jonathanfilip/vim-lucius'
Plug 'joshdick/onedark.vim'
Plug 'juanedi/predawn.vim'
Plug 'julienxx/hemisu'
Plug 'junegunn/seoul256.vim'
Plug 'kabbamine/yowish.vim'
Plug 'keith/parsec.vim'
Plug 'kokakolako/vim-hemisu-airline'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'marcopaganini/termschool-vim-theme'
Plug 'mhartington/oceanic-next'
Plug 'mhinz/vim-janah'
Plug 'mkarmona/colorsbox'
Plug 'morhetz/gruvbox'
Plug 'mswift42/vim-themes'
Plug 'nanotech/jellybeans.vim'
Plug 'notpratheek/vim-luna'
Plug 'nyomaszto/crayon'
Plug 'petelewis/vim-evolution'
Plug 'rakr/vim-one'
Plug 'rakr/vim-two-firewatch'
Plug 'romainl/Apprentice'
Plug 'romainl/flattened'
Plug 'scheakur/vim-scheakur'
Plug 'sheerun/vim-wombat-scheme'
Plug 'sjl/badwolf'
Plug 'sts10/vim-mustard'
Plug 'thriveth/vim-twilight-bright'
Plug 'tomasr/molokai'
Plug 'tpope/vim-vividchalk'
Plug 'twerth/ir_black'
Plug 'vim-scripts/twilight'
Plug 'vim-scripts/twilight256.vim'
Plug 'w0ng/vim-hybrid'
Plug 'whatyouhide/vim-gotham'
Plug 'wimstefan/Lightning'
Plug 'zanglg/nova.vim'
call plug#end()

source $HOME/.config/nvim/setup/airline.vim
" source $HOME/.config/nvim/setup/ctrlp.vim
source $HOME/.config/nvim/setup/ultisnips.vim
source $HOME/.config/nvim/setup/deoplete.vim
source $HOME/.config/nvim/setup/supertab.vim
source $HOME/.config/nvim/setup/easyalign.vim
source $HOME/.config/nvim/setup/file-open-mappings.vim
source $HOME/.config/nvim/setup/folding.vim
source $HOME/.config/nvim/setup/functions.vim
source $HOME/.config/nvim/setup/fzf.vim
source $HOME/.config/nvim/setup/nerdcommenter.vim
source $HOME/.config/nvim/setup/sneak.vim
source $HOME/.config/nvim/setup/vim-multiple-cursors.vim
" source $HOME/.config/nvim/setup/vim-windowswap.vim
source $HOME/.config/nvim/setup/base16.vim
source $HOME/.config/nvim/setup/conflicted.vim
source $HOME/.config/nvim/setup/vimwiki.vim
source $HOME/.config/nvim/setup/ripgrep.vim
source $HOME/.config/nvim/setup/rubocop.vim


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
nnoremap <Leader>b :Bdelete<Enter>
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'
tnoremap <Esc> <c-\><c-n>
nnoremap <silent> <Esc><Esc> :nohlsearch<CR>

au! BufNewFile,BufRead *.csv setf csv

" useful macros
let @n='zRGy14kggP<Esc>:read !date "+\%B \%d, \%A"'
let @d=':read !date "+\%B \%d, \%A"'

" incremental command support
if exists('&inccommand')
  set inccommand=split
endif

" Show syntax highlighting groups for word under cursor
nmap <leader>z :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

let colors = ['PaperColor', 'crayon', 'oceanicnext', 'gruvbox', 'solarized', 'hemisu', 'apprentice', 'jellybeans', 'wombat', 'monochrome', 'alduin', 'sierra', 'dracula', 'one', 'tender', 'ir_black', 'base16-eighties']
if $ITERM_PROFILE != ""
  if index(colors, $ITERM_PROFILE) != -1
    exe "color ".$ITERM_PROFILE
    if filereadable($HOME . "/.config/nvim/setup/color-" . $ITERM_PROFILE. ".vim")
      source $HOME/.config/nvim/setup/color-$ITERM_PROFILE.vim
    endif
  elseif index(colors, substitute($ITERM_PROFILE, '-dark\|-light', '', '')) != -1
    let baseColor = substitute($ITERM_PROFILE, '-dark\|-light', '', '')
    let variant   = substitute($ITERM_PROFILE, baseColor . '-', '', '')
    exe "color ".baseColor
    exe "set bg=".variant
    if filereadable($HOME . "/.config/nvim/setup/color-" . $ITERM_PROFILE . ".vim")
      source $HOME/.config/nvim/setup/color-$ITERM_PROFILE.vim
    endif
  endif
else
  color apprentice
  source $HOME/.config/nvim/setup/color-apprentice.vim
endif

" augroup CursorLine
  " au!
  " au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  " au WinLeave * setlocal nocursorline
" augroup END


" no colorcolumn, please
set colorcolumn=
