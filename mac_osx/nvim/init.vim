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
set listchars=eol:¬,tab:▸\
set nobackup
set backupdir=~/.vim_backup
set directory=~/.vim_backup
set hidden
set diffopt=filler,vertical,iwhite
" syntax sync minlines=256

let mapleader = "\<Space>"
let g:python3_host_prog='/usr/local/bin/python3'
set clipboard^=unnamedplus
" set clipboard+=unnamed
" let g:airline_powerline_fonts = 0
" let g:airline_symbols_ascii = 1

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors

" used by deoplete
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

" Load vim-plug
if empty(glob("~/.config/nvim/autoload/plug.vim"))
    execute '!curl -fLo ~/.config/nvim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

set rtp+=~/.fzf
call plug#begin('~/.config/nvim/plugged')
" leave supertab at the top or it will throw an error
Plug 'metalelf0/supertab'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Plug 'justinmk/vim-sneak'
Plug 'easymotion/vim-easymotion'
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
Plug 'jeetsukumaran/vim-filebeagle'
Plug 'tpope/vim-rbenv'
Plug 'tpope/vim-endwise'
Plug 'docunext/closetag.vim'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'wellle/targets.vim'
" Plug 'qpkorr/vim-bufkill'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'fishbullet/deoplete-ruby'
" deoplete ruby-code-tools
" requisite: `gem install rcodetools fastri`
Plug 'Shougo/deoplete-rct'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'
Plug 'w0rp/ale'
Plug 'christoomey/vim-conflicted'
Plug 'ludovicchabant/vim-gutentags'
Plug 'vimwiki/vimwiki'
Plug 'metalelf0/vim-bbye'
Plug 'sbdchd/neoformat'
Plug 'vim-scripts/ScrollColors'
Plug 'bronson/vim-visual-star-search'
Plug 'mattn/emmet-vim'
Plug 'janko-m/vim-test'
Plug 'equalsraf/neovim-gui-shim'
Plug 'guywald1/vim-prismo' " beautify comments with :Prismo
Plug 'junegunn/goyo.vim'
Plug 'benmills/vimux'
Plug 'sheerun/vim-polyglot'
Plug 'airblade/vim-gitgutter'

" ------------------------------------ RUBY -----------------------------------
" Plug 'osyo-manga/vim-monster', { 'for': ['ruby', 'eruby'] }
Plug 'tpope/vim-rbenv', { 'for': ['ruby', 'eruby'] }
" Plug 'vim-ruby/vim-ruby', { 'for': ['ruby', 'eruby'] }
Plug 'alexgenco/neovim-ruby', { 'for': ['ruby', 'eruby'] }
Plug 'tpope/vim-rails', { 'for': ['ruby', 'eruby'] }
Plug 'Keithbsmiley/rspec.vim', { 'for': ['ruby'] }
Plug 'sunaku/vim-ruby-minitest', { 'for': ['ruby'] }
Plug 'jiajiawang/vim-ruby-helper', { 'for': ['ruby'] }
Plug 'ecomba/vim-ruby-refactoring', { 'for': ['ruby'] }

" --------------------------------- JAVASCRIPT --------------------------------
Plug 'othree/yajs.vim', { 'for': ['javascript'] }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript'] }
Plug 'moll/vim-node', { 'for': ['javascript'] }
Plug 'elzr/vim-json', { 'for': ['json', 'javascript'] }
Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }
Plug 'kchmck/vim-coffee-script', { 'for': ['coffee'] }

" ----------------------------------- MARKUP ----------------------------------
Plug 'othree/html5.vim', { 'for': ['html', 'javascript', 'eruby'] }
Plug 'hail2u/vim-css3-syntax', { 'for': ['html', 'css', 'eruby'] }
Plug 'plasticboy/vim-markdown', { 'for': ['mkd', 'markdown', 'mkd.markdown'] }
Plug 'cakebaker/scss-syntax.vim', { 'for': ['scss'] }
Plug 'tpope/vim-haml', { 'for': ['haml'] }

" ----------------------------------- COLORS ----------------------------------
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
" Plug 'kokakolako/vim-hemisu-airline'
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
Plug 'trevordmiller/nova-vim'
Plug 'arcticicestudio/nord-vim'
Plug 'fcpg/vim-orbital'
Plug 'danilo-augusto/vim-afterglow'
Plug 'reedes/vim-colors-pencil'
Plug 'float168/vim-colors-cherryblossom'
Plug 'protesilaos/prot16-vim'
" Plug 'protesilaos/prot16-vim-airline'
Plug 'ayu-theme/ayu-vim' " or other package manager
Plug 'zcodes/vim-colors-basic'
Plug 'nightsense/office'
Plug 'cocopon/iceberg.vim'
Plug 'archseer/colibri.vim'
Plug 'gosukiwi/vim-atom-dark'
Plug 'kocakosm/hilal'
Plug 'rhysd/vim-color-spring-night'
call plug#end()

" source $HOME/.config/nvim/setup/airline.vim
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
" source $HOME/.config/nvim/setup/ripgrep.vim
source $HOME/.config/nvim/setup/rubocop.vim
source $HOME/.config/nvim/setup/vim-test.vim
source $HOME/.config/nvim/setup/statusline.vim
source $HOME/.config/nvim/setup/gitgutter.vim
source $HOME/.config/nvim/setup/vimux.vim
" source $HOME/.config/nvim/setup/rubycomplete.vim

" ------------------------------------ ALE ------------------------------------

let g:ale_pattern_options = {
\   '.*db/schema.rb$': {'ale_enabled': 0}
\}

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
vmap <C-f> y0/<C-r>"<Enter>cgn

let g:rubycomplete_rails = 1

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

if has("termguicolors")     " set true colors
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

let colors = ['PaperColor', 'crayon', 'oceanicnext', 'gruvbox', 'solarized', 'hemisu', 'apprentice', 'jellybeans', 'wombat', 'monochrome', 'alduin', 'sierra', 'dracula', 'one', 'tender', 'tender-blue', 'ir_black', 'base16-eighties', 'hybrid', 'nord', 'ficus_light', 'desert']
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
elseif filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
else
  color apprentice
  source $HOME/.config/nvim/setup/color-apprentice.vim
endif

" dont try to setup airline colors, cause no airline here
let g:base16_airline=0

" if filereadable(expand("~/.vimrc_background"))
"   let base16colorspace=256
"   source ~/.vimrc_background
" endif

" augroup CursorLine
  " au!
  " au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  " au WinLeave * setlocal nocursorline
" augroup END

if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading
elseif executable('pt')
  set grepprg=pt\ --nogroup\ --nocolor\ --ignore-case
elseif executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
endif


" no colorcolumn, please
set colorcolumn=
" oni_config_file = $HOME/.oni/config.js
