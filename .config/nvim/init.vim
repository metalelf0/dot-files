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
set number
set relativenumber
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
set pyxversion=3
set clipboard^=unnamedplus
set inccommand=split
set termguicolors
set gdefault
set equalalways
set noshowmode

set listchars=tab:│\ ,extends:>,precedes:<,nbsp:%,trail:∙
set list
set fillchars=vert:│,fold:─
let false = 0
let true = !false
let gui = has('gui_running') ? true : false

" python config
let $PYENV_ROOT = systemlist('pyenv root')[0]
let g:python_host_prog =  expand($PYENV_ROOT) . '/shims/python'
let g:python3_host_prog = expand($PYENV_ROOT) . '/shims/python3'
let g:loaded_python_provider = 1

" Load vim-plug {{{1
if empty(glob("~/.config/nvim/autoload/plug.vim"))
    execute '!mkdir -p ~/.config/nvim/autoload'
    execute '!curl -fLo ~/.config/nvim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

" vim-plug plugins {{{1

" notational-fzf-vim {{{2
let g:nv_search_paths = ['~/notes', '~/Documents/notes.md']

call plug#begin('~/.config/nvim/plugged')
" plugins {{{2
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'benmills/vimux'
Plug 'janko/vim-test'
Plug 'jreybert/vimagit'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'kchmck/vim-coffee-script', { 'for': ['coffee'] }
" Plug 'ludovicchabant/vim-gutentags'
Plug 'mhinz/vim-signify'
Plug 'michaeljsmith/vim-indent-object'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails', { 'for': ['ruby', 'eruby'] }
Plug 'tpope/vim-rbenv', { 'for': ['ruby', 'eruby'] }
Plug 'NLKNguyen/cloudformation-syntax.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-rsi'
Plug 'itchyny/lightline.vim'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'easymotion/vim-easymotion'
Plug 'skywind3000/asyncrun.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'cameronbrown/vim-colorscheme-switcher'
Plug 'xolox/vim-misc'
Plug 'alok/notational-fzf-vim'
Plug 'metalelf0/vimt0d0'
Plug 'rhysd/git-messenger.vim'
Plug 'mattn/emmet-vim'
Plug 'junegunn/goyo.vim'
Plug 'luochen1990/rainbow'
Plug 'tpope/vim-abolish'
Plug 'jiangmiao/auto-pairs'
Plug 'kkoomen/vim-doge'
Plug 'RRethy/vim-illuminate'
Plug 'junegunn/vim-journal'
Plug 'mhinz/vim-startify'
Plug 'terryma/vim-multiple-cursors'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'sheerun/vim-polyglot'
" Plug 'liuchengxu/vim-clap'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
" Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'dhruvasagar/vim-dotoo'
Plug 'godlygeek/tabular'
" Plug 'plasticboy/vim-markdown'
" colorschemes {{{2
Plug 'cocopon/iceberg.vim'
Plug 'jacoborus/tender.vim'
" Plug 'NerdyPepper/vim-colors-plain'
Plug 'metalelf0/apprentice'
Plug 'gruvbox-community/gruvbox'
Plug 'scwood/vim-hybrid'
" Plug 'fcpg/vim-fahrenheit'
Plug 'arcticicestudio/nord-vim'
Plug 'nanotech/jellybeans.vim'
" Plug 'joshdick/onedark.vim'
Plug 'rakr/vim-one'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'liuchengxu/space-vim-theme'
" Plug 'owickstrom/vim-colors-paramount'
Plug 'dylanaraps/wal.vim'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'NLKNguyen/papercolor-theme'
Plug 'mhartington/oceanic-next'
Plug 'ayu-theme/ayu-vim'
" Plug 'yorickpeterse/happy_hacking.vim'
Plug 'bluz71/vim-moonfly-colors'
" Plug 'freeo/vim-kalisi'
Plug 'junegunn/seoul256.vim'
Plug 'jnurmine/Zenburn'
" Plug 'drewtempelmeyer/palenight.vim'
Plug 'noahfrederick/vim-hemisu'
" Plug 'sjl/badwolf'
Plug 'chriskempson/base16-vim'
" Plug 'aonemd/kuroi.vim'
Plug 'fenetikm/falcon'
" Plug 'ajmwagar/vim-deus'
" Plug 'romainl/flattened'
" Plug 'reedes/vim-colors-pencil'
Plug 'sainnhe/vim-color-forest-night'
Plug 'sainnhe/archived-colors'
Plug 'sainnhe/gruvbox-material'
Plug 'sainnhe/edge'
Plug 'rhysd/vim-color-spring-night'
Plug 'nightsense/snow'
" Plug 'dracula/vim', { 'as': 'dracula' }
" Plug 'mhinz/vim-janah'
" Plug 'srcery-colors/srcery-vim'
" Plug 'arzg/vim-corvine'
" Plug 'kaicataldo/material.vim'
" Plug 'ajh17/Spacegray.vim'
" Plug 'doums/darcula'
" Plug 'AlessandroYorba/alduin'
Plug 'rakr/vim-two-firewatch'
" Plug 'haishanh/night-owl.vim'
" Plug 'wadackel/vim-dogrun'
" Plug 'gmoe/vim-espresso'
" Plug 'arzg/vim-substrata'
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'Nequo/vim-allomancer'
Plug 'wimstefan/vim-artesanal'
Plug 'fcpg/vim-orbital'
call plug#end()

" Plugin configurations {{{1{{{
" NERDCommenter {{{2
" add extra spaces around delimiters
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'

" vim-test {{{2
nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ts :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tv :TestVisit<CR>
" $ kitty -o allow_remote_control=yes --listen-on unix:/tmp/mykitty
" export KITTY_LISTEN_ON=/tmp/mykitty
if has('gui_vimr')
  let test#strategy="neovim"
else
  let test#strategy="kitty"
endif



" LeaderF {{{2
" let g:Lf_WindowPosition = 'popup'
" let g:Lf_PreviewInPopup = 1
" let g:Lf_UseVersionControlTool = 1
" let g:Lf_ShortcutF = "<leader>p"
" noremap <leader>B :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
" noremap <leader>R :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
" noremap <leader>/ :<C-U><C-R>=printf("Leaderf rg --match-path %s", "")<CR><CR>
" noremap <leader>K :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
"
" vim-clap {{{2
" nnoremap <Leader>p :Clap files<CR>
" nnoremap <Leader>B :Clap buffers<CR>
" nnoremap <Leader>C :Clap colors<CR>
" nnoremap <Leader>/ :Clap grep<CR>
" nnoremap <Leader>K :Clap grep ++query=<cword><CR>

" let g:clap_popup_input_delay=0
" let g:clap_provider_grep_delay=0
" " let g:clap_theme='material_design_dark'
" let g:clap_layout = { 'relative': 'editor' }
" FZF {{{2
set rtp+=~/.fzf

let g:fzf_buffers_jump = 1

nnoremap <c-p> :FZF<cr>
nnoremap <silent> <leader>p :Files<CR>
nnoremap <silent> <leader>B :Buffers<CR>
nnoremap <silent> <leader>; :BLines<CR>
nnoremap <silent> <leader>. :Lines<CR>
nnoremap <silent> <leader>o :BTags<CR>
nnoremap <silent> <leader>O :Tags<CR>
nnoremap <silent> <leader>: :Commands<CR>
nnoremap <silent> <leader>? :History<CR>
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
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

nnoremap <silent> <leader>/ :execute 'Rg'<CR>

" EasyAlign {{{2
vmap <Enter> <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)

" Gutentags {{{2
let g:gutentags_define_advanced_commands = 1
let g:gutentags_ctags_exclude = [".git", "node_modules", "log", "vendor", "solr-7.3.0"]

" Lightline {{{2
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo', 'clock' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'cocstatus': 'coc#status',
      \   'filename': 'LightLineFilename',
      \   'clock'   : 'LightLineClock',
      \ },
      \ }

" set showtabline=2
" let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
" let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
" let g:lightline.component_type   = {'buffers': 'tabsel'}
" let g:lightline#bufferline#filename_modifier = ':t'

function! LightLineFilename()
  return winwidth(0) > 80 ? expand('%') : expand('%:t')
endfunction

function LightLineClock()
  return strftime("%H:%M")
endfunction

" easyMotion {{{2
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment

hi link EasyMotionTarget2First MatchParen
hi link EasyMotionTarget2Second MatchParen

hi link EasyMotionMoveHL Search
hi link EasyMotionIncSearch Search

nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)

" COC.nvim {{{2
set cmdheight=2
set updatetime=300
set shortmess+=c

let g:coc_global_extensions = ['coc-solargraph']

let g:coc_force_debug=1
"Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Get outline
nnoremap <silent> <Leader>co :<C-u>CocList outline<CR>
" Get symbols
nnoremap <silent> <Leader>cs :<C-u>CocList -I symbols<CR>
" Get errors
nnoremap <silent> <Leader>cl :<C-u>CocList locationlist<CR>
" Get available commands
nnoremap <silent> <Leader>cc :<C-u>CocList commands<CR>

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` for fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" jellybeans {{{2
let g:jellybeans_use_gui_italics = 0
let g:jellybeans_use_term_italics = 0

" rainbow {{{2
" enabled with :RainbowToggle
let g:rainbow_active = 0

" vim-dotoo {{{2
let g:dotoo#capture#refile = expand('~/Notes/refile.dotoo')
let g:dotoo#agenda#files = ['~/Notes/*.dotoo']
" }}}
"mappings I like {{{1
" cmap w!! w !sudo tee % >/dev/null
inoremap kj <Esc>
tnoremap <Esc> <c-\><c-n>
nnoremap <silent> <Esc><Esc> :nohlsearch<CR>
vmap <C-f> y0/<C-r>"<Enter>cgn
nnoremap <Leader>f viwy0/<C-r>"<Enter>cgn
vnoremap * y/\V<C-r>=escape(@",'/\')<CR><CR>

nnoremap <Leader>r xepwdW/:<CR><CR>

" fuzzy incremental search
map z/ <Plug>(incsearch-fuzzy-/)
map z? <Plug>(incsearch-fuzzy-?)
map zg/ <Plug>(incsearch-fuzzy-stay)

" Show syntax highlighting groups for word under cursor
nmap <leader>z :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" sends the currently visual-selected text to rails runner
function! SendVisualToRailsRunner() range
    let n = @n
    silent! normal gv"ny
    echo system("bin/rails runner '" . @n . "'")
    let @n = n
    " bonus: restores the visual selection
    normal! gv
endfunction

xnoremap <F6> :call SendVisualToRailsRunner()<CR>

" and some file-open-mappings {{{2
map <Leader>J :vsplit $HOME/Documents/journal.md<Enter>
" map <Leader>N :vsplit $HOME/Documents/notes.md<Enter>
map <Leader>N :NV<Enter>
map <Leader>T :split $HOME/Documents/todo/todo.txt<Enter>
map <Leader>V :vsplit $MYVIMRC<Enter>
map <Leader>Z :vsplit $HOME/.zshrc<Enter>

" useful autocommands {{{1{{{
" strip trailing whitespaces
autocmd BufWritePre *.erb,*.rb,*.rake,*.py,*.vim,*.css,*.js,*.html,*.cpp,*.c,*.java,*.go,*.rs,*.ts,*.cljs,*.clj,*.php :%s/\s\+$//e

" restore guicursor on vim exit
au VimLeave * set guicursor=a:block-blinkon0


" custom functions {{{1

fun! ToggleFocus()
  if getline(".") =~ ", focus: true"
    execute 's/, focus: true//'
  else
    execute 's/ do$/, focus: true do/'
  endif
endfun
nmap <Leader>F :call ToggleFocus()<Enter>

fun! ChangeLightlineColorscheme(newScheme)
  call lightline#toggle()
  let g:lightline.colorscheme=a:newScheme
  call lightline#toggle()
endfun

" grepprg configuration {{{1
if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading
elseif executable('pt')
  set grepprg=pt\ --nogroup\ --nocolor\ --ignore-case
elseif executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
endif


" filetype overrides {{{1
autocmd FileType php setlocal shiftwidth=4 tabstop=4

" color and niceties {{{1
"
" if (has("autocmd"))
"   augroup colorextend
"     autocmd!
"     " Override the `Identifier` background color in GUI mode
"     autocmd ColorScheme * call onedark#extend_highlight("rubySymbol", { "fg": { "gui": "#98C379" } })
"   augroup END
" endif


set bg=light
" let g:ayucolor="dark"
let g:lightline.colorscheme = "edge"
colo edge

if g:colors_name == "darcula"
  call darcula#Hi('rubySymbol', darcula#palette.constant)
endif

set pumblend=20

" veonim {{{1
let g:vn_font = 'Iosevka'
let g:vn_font_size = 18
let g:vn_line_height = '1.5'

" gonvim {{{1
if exists('g:gonvim_running')
  set laststatus=0
  set noshowmode
  set noruler
endif

" vv {{{1
if exists('g:vv')
  VVset fontfamily="Iosevka"
  VVset fontsize=16
  VVset lineheight=1.5
endif

" fvim {{{1
if exists('g:fvim_loaded')
  set gfn=Iosevka:h16
  FVimFontLineHeight '+3.0'
end
"}}}

