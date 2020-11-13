" vim: tw=70 fdm=marker fdl=0 nomodeline:
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
let false=0
let true=!false
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
" todoist.vim  {{{2
let todoist_api_key = $TODOIST_API_KEY

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
Plug 'idanarye/vim-merginal'
Plug 'tpope/vim-rails', { 'for': ['ruby', 'eruby', 'slim'] }
Plug 'tpope/vim-rbenv', { 'for': ['ruby', 'eruby'] }
Plug 'NLKNguyen/cloudformation-syntax.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-projectionist'
Plug 'slim-template/vim-slim'
" Plug 'itchyny/lightline.vim'

Plug 'neovim/nvim-lsp'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/diagnostic-nvim'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-lua/telescope.nvim'

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
Plug 'metalelf0/todoplus.vim'
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
" Plug 'terryma/vim-multiple-cursors'
Plug 'mg979/vim-visual-multi'
Plug 'norcalli/nvim-colorizer.lua'
" Plug 'sheerun/vim-polyglot'
Plug 'liuchengxu/vim-clap'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
" Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
" Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'dhruvasagar/vim-dotoo'
Plug 'godlygeek/tabular'
" Plug 'plasticboy/vim-markdown'
Plug 'stsewd/fzf-checkout.vim'
Plug 'freitass/todo.txt-vim'
" Plug 'vimwiki/vimwiki'
" Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/gv.vim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'majutsushi/tagbar'
Plug 'airblade/vim-rooter'
Plug 'chaoren/vim-wordmotion'
Plug 'wfxr/minimap.vim'
Plug 'ryanoasis/vim-devicons'





" colorschemes {{{2
Plug 'cocopon/iceberg.vim'
Plug 'jacoborus/tender.vim'
" Plug 'NerdyPepper/vim-colors-plain'
Plug 'metalelf0/apprentice'
Plug 'gruvbox-community/gruvbox'
Plug 'scwood/vim-hybrid'
" Plug 'cocopon/lightline-hybrid.vim'
" Plug 'fcpg/vim-fahrenheit'
" Plug 'arcticicestudio/nord-vim'
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
Plug 'romainl/flattened'
" Plug 'reedes/vim-colors-pencil'
Plug 'sainnhe/vim-color-forest-night'
Plug 'sainnhe/archived-colors'
Plug 'sainnhe/gruvbox-material'
Plug 'habamax/vim-gruvbit'
Plug 'sainnhe/edge'
Plug 'rhysd/vim-color-spring-night'
Plug 'nightsense/snow'
Plug 'dracula/vim', { 'as': 'dracula' }
" Plug 'mhinz/vim-janah'
" Plug 'srcery-colors/srcery-vim'
" Plug 'arzg/vim-corvine'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'ajh17/Spacegray.vim'
" Plug 'doums/darcula'
" Plug 'AlessandroYorba/alduin'
Plug 'rakr/vim-two-firewatch'
" Plug 'haishanh/night-owl.vim'
" Plug 'wadackel/vim-dogrun'
" Plug 'gmoe/vim-espresso'
" Plug 'arzg/vim-substrata'
Plug 'bluz71/vim-nightfly-guicolors'
" Plug 'Nequo/vim-allomancer'
" Plug 'wimstefan/vim-artesanal'
Plug 'fcpg/vim-orbital'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'chuling/vim-equinusocio-material'
" Plug 'rafalbromirski/vim-aurora'
Plug 'https://gitlab.com/protesilaos/tempus-themes-vim.git'
Plug 'sainnhe/sonokai'
Plug 'tomasiser/vim-code-dark'
Plug 'chuling/ci_dark'
Plug 'franbach/miramare'
Plug 'co1ncidence/mountaineer'
Plug 'co1ncidence/bliss'
Plug 'pradyungn/Mountain', { 'rtp': 'vim' }
Plug 'drewtempelmeyer/palenight.vim'
Plug 'Rigellute/rigel'
Plug 'cormacrelf/vim-colors-github'
Plug 'co1ncidence/gunmetal.vim'
Plug 'ChristianChiarulli/nvcode-color-schemes.vim'
" Plug 'NieTiger/halcyon-neovim'
call plug#end()

"
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
let g:test#strategy="vimux"

" Telescope {{{2
" lua <<EOF
" -- bat is not expanding '~', so let's try this.
" require('telescope').setup {
"   defaults = {
"     shorten_path = false -- currently the default value is true
"   }
" }
" EOF

" " nnoremap <Leader>p <cmd>lua require'telescope.builtin'.git_files{}<CR>
" nnoremap <Leader>p <cmd>lua require'telescope.builtin'.find_files{}<CR>
" nnoremap <Leader>/ <cmd>lua require'telescope.builtin'.live_grep{}<CR>
" nnoremap <Leader>K <cmd>lua require'telescope.builtin'.grep_string{ search = cword }<CR>
" nnoremap <Leader>B <cmd>lua require'telescope.builtin'.buffers{}<CR>
" }}}

" vim-clap {{{2
nnoremap <Leader>p :Clap files<CR>
nnoremap <Leader>B :Clap buffers<CR>
nnoremap <Leader>C :Clap colors<CR>
nnoremap <Leader>/ :Clap grep<CR>
nnoremap <Leader>K :Clap grep ++query=<cword><CR>
nnoremap <Leader>R :Clap history<CR>

let g:clap_popup_input_delay=0
let g:clap_provider_grep_delay=0
" let g:clap_theme='material_design_dark'
let g:clap_layout = { 'relative': 'editor' }
" }}}

" FZF {{{2
set rtp+=~/.fzf
set rtp+=$HOME/Documents/codice_elf0/todoplus.vim

let g:fzf_buffers_jump = 1

let $FZF_DEFAULT_COMMAND = 'rg --files'

" nnoremap <c-p> :FZF<cr>
" nnoremap <silent> <leader>p :Files<CR>
" nnoremap <silent> <leader>B :Buffers<CR>
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

autocmd! FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

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

" nnoremap <silent> <leader>/ :execute 'Rg'<CR>

" fzf-checkout {{{2
let g:fzf_checkout_git_options = '--sort=-committerdate'
" }}}
" EasyAlign {{{2
vmap <Enter> <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)

" Gutentags {{{2
let g:gutentags_define_advanced_commands = 1
let g:gutentags_ctags_exclude = [".git", "node_modules", "log", "vendor", "solr-7.3.0"]

" Lightline {{{2

" let g:lightline = {
"       \ 'active': {
"       \   'left': [ [ 'mode', 'paste' ],
"       \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
"       \   'right': [ [ 'lineinfo', 'clock' ],
"       \              [ 'percent' ],
"       \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
"       \ },
"       \ 'component_function': {
"       \   'gitbranch': 'fugitive#head',
"       \   'filename': 'LightLineFilename',
"       \   'clock'   : 'LightLineClock',
"       \ },
"       \ }


" set showtabline=2
" let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
" let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
" let g:lightline.component_type   = {'buffers': 'tabsel'}
" let g:lightline#bufferline#filename_modifier = ':t'

" function! LightLineFilename()
"   return winwidth(0) > 80 ? expand('%') : expand('%:t')
" endfunction

" function LightLineClock()
"   return strftime("%H:%M")
" endfunction

" easyMotion {{{2
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment

hi link EasyMotionTarget2First MatchParen
hi link EasyMotionTarget2Second MatchParen

hi link EasyMotionMoveHL Search
hi link EasyMotionIncSearch Search

nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)

" nvim-lsp {{{2
 nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
 nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
 nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
 nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
 nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
 nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
 nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
 nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
 nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
 " show diagnostics on CursorHold event
 " it's triggered after <updatetime> ms
 autocmd CursorHold * lua vim.lsp.util.show_line_diagnostics()

lua <<EOF
    local api = vim.api

    local nvim_lsp = require'nvim_lsp'

    local on_attach_callback = function(_, bufnr)
      api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
      require'diagnostic'.on_attach(_)
      require'completion'.on_attach(_)
    end

    nvim_lsp.solargraph.setup{on_attach=require'completion'.on_attach}
    nvim_lsp.tsserver.setup{on_attach=require'completion'.on_attach}

    api.nvim_set_var('diagnostic_enable_virtual_text', 0)
    api.nvim_set_var('diagnostic_sign_priority', 20)
EOF
"" }}}
" completion-nvim {{{2
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

" Don't sort results, use the order returned by the LSP engine
let g:completion_sorting="none"
" let g:completion_enable_snippet = 'UltiSnips'
" }}}
" vim-journal customizations {{{2
syn match checkboxChecked   /\[[\zsxov\ze]\]/
syn match checkboxException /\[[\zs*!\ze]\]/
syn match checkboxEtc       /\[[\zs+=-\ze]\]/
" }}}
"jellybeans {{{2
let g:jellybeans_use_gui_italics = 0
let g:jellybeans_use_term_italics = 0

" rainbow {{{2
" enabled with :RainbowToggle
let g:rainbow_active = 0

" vim-dotoo {{{2
let g:dotoo#capture#refile = expand('~/Notes/refile.dotoo')
let g:dotoo#agenda#files = ['~/Notes/*.dotoo']
" }}}
" vim-maximize-window-toggle: <Leader>o {{{2
function! ToggleOnly()
  if winnr("$") > 1
  " There are more than one window in this tab
    if exists("b:maximized_window_id")
      call win_gotoid(b:maximized_window_id)
    else
      let b:origin_window_id = win_getid()
      tab sp
      let b:maximized_window_id = win_getid()
    endif
  else
  " This is the only window in this tab
    if exists("b:origin_window_id")
      let l:origin_window_id = b:origin_window_id
      tabclose
      call win_gotoid(l:origin_window_id)
      unlet b:maximized_window_id
      unlet b:origin_window_id
    endif
  endif
endfunction

nnoremap <leader>z :call ToggleOnly()<Enter>
" }}}
" nvim-treesitter: {{{2
lua <<EOF
require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,                    -- false will disable the whole extension
        disable = {},        -- list of language that will be disabled
    },
    incremental_selection = {
        enable = true,
        disable = { 'cpp', 'lua' },
        keymaps = {                       -- mappings for incremental selection (visual mappings)
          init_selection = 'gtn',         -- maps in normal mode to init the node/scope selection
          node_incremental = "gti",       -- increment to the upper named parent
          scope_incremental = "gtc",      -- increment to the upper scope (as defined in locals.scm)
          node_decremental = "gtm",       -- decrement to the previous node
        }
    },
    refactor = {
      highlight_defintions = {
        enable = true
      },
      smart_rename = {
        enable = true,
        smart_rename = "grr"              -- mapping to rename reference under cursor
      },
      navigation = {
        enable = true,
        goto_definition = "gnd",          -- mapping to go to definition of symbol under cursor
        list_definitions = "gnD"          -- mapping to list all definitions in current file
      }
    },
    ensure_installed = 'all' -- one of 'all', 'language', or a list of languages
}
EOF
"}}}
"mappings I like {{{1
" cmap w!! w !sudo tee % >/dev/null
inoremap kj <Esc>
tnoremap <Esc> <c-\><c-n>
nnoremap <silent> <Esc><Esc> :nohlsearch<CR>
vmap <C-f> y0/<C-r>"<Enter>cgn
nnoremap <Leader>f viwy0/<C-r>"<Enter>cgn
vnoremap * y/\V<C-r>=escape(@",'/\')<CR><CR>

nnoremap <Leader>r xepwdW/:<CR><CR>

" gitmoji-selector
nmap <Leader>G "=system('gitmoji-selector')<C-M>P

" fuzzy incremental search
map z/ <Plug>(incsearch-fuzzy-/)
map z? <Plug>(incsearch-fuzzy-?)
map zg/ <Plug>(incsearch-fuzzy-stay)

" Show syntax highlighting groups for word under cursor
nmap <leader>y :call <SID>SynStack()<CR>
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

" put those damn arrows to a use
nnoremap <Up> :resize -2<CR>
nnoremap <Down> :resize +2<CR>
nnoremap <Left> :vertical resize -2<CR>
nnoremap <Right> :vertical resize +2<CR>


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

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank("IncSearch", 1000)
augroup END

if !exists('g:projects')
  let g:projects = {}
endif

augroup project_discovery
  autocmd!
  autocmd User Fugitive let g:projects[fnamemodify(fugitive#repo().dir(), ':h')] = 1
augroup END

function! s:switch_project(path)
  mksession!
  silent! execute "%bd|e#|bd#"
  " bufdo bd
  cd `=a:path`
  let s:session_file=getcwd() . "/Session.vim"
  echom s:session_file
  if filereadable(s:session_file)
    echom "File exists!"
    exe "source " . s:session_file
  endif
endfunction

command! -complete=customlist,s:project_complete -nargs=1 Project call s:switch_project(<f-args>)

function! s:project_complete(lead, cmdline, _) abort
  let results = keys(get(g:, 'projects', {}))

  " use projectionist if available
  if exists('*projectionist#completion_filter')
    return projectionist#completion_filter(results, a:lead, '/')
  endif

  " fallback to cheap fuzzy matching
  let regex = substitute(a:lead, '.', '[&].*', 'g')
  return filter(results, 'v:val =~ regex')
endfunction

" custom functions {{{1

fun! ToggleFocus()
  if getline(".") =~ ", focus: true"
    execute 's/, focus: true//'
  else
    execute 's/ do$/, focus: true do/'
  endif
endfun
nmap <Leader>F :call ToggleFocus()<Enter>

" fun! ChangeLightlineColorscheme(newScheme)
"   call lightline#toggle()
"   let g:lightline.colorscheme=a:newScheme
"   call lightline#toggle()
" endfun

function! ReplaceAccents()
  execute "%s/a'/à/g"
  execute "%s/e'/é/g"
  execute "%s/e`/è/g"
  execute "%s/i'/ì/g"
  execute "%s/o'/ò/g"
  execute "%s/u'/ù/g"
endfunction
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

autocmd FileType php setlocal foldmethod=indent

" color and niceties {{{1
"
" if (has("autocmd"))
"   augroup colorextend
"     autocmd!
"     " Override the `Identifier` background color in GUI mode
"     autocmd ColorScheme * call onedark#extend_highlight("rubySymbol", { "fg": { "gui": "#98C379" } })
"   augroup END
" endif

function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c

augroup nord-overrides
  autocmd!
  autocmd ColorScheme nord highlight rubyInstanceVariable guifg='#88c0d0'
  autocmd ColorScheme nord highlight rubyConstant gui=bold
  autocmd ColorScheme nord highlight TodoPriorityA guifg='#8FBCBB' gui=bold
  autocmd ColorScheme nord highlight TodoPriorityB guifg='#88C0D0'
  autocmd ColorScheme nord highlight TodoPriorityC guifg='#81A1C1'
  autocmd ColorScheme nord highlight TodoPriorityD guifg='#5E81AC'
  autocmd ColorScheme nord highlight TodoProject guifg='#BF616A'
  autocmd ColorScheme nord highlight TodoContext guifg='#D08770'
  autocmd ColorScheme nord highlight link TodoDate Special
  " autocmd ColorScheme nord call ChangeLightlineColorscheme('nord')
augroup END

augroup jellybeans-overrides
  let g:jellybeans_overrides = {
        \    'background': { 'ctermbg': 'none', '256ctermbg': 'none' },
        \}
  if has('termguicolors') && &termguicolors
    let g:jellybeans_overrides['background']['guibg'] = 'none'
  endif
augroup END

augroup hybrid-overrides
  autocmd!
  autocmd ColorScheme hybrid highlight Normal guibg='#161718'
augroup END

augroup mountain-overrides
  autocmd!
  autocmd ColorScheme mountain source ~/.config/nvim/plugged/Mountain/vim/statusline.vim
augroup END

" augroup gruvbox-overrides
"   autocmd!
"   autocmd ColorScheme gruvbox highlight Normal guibg='#000011'
" augroup END
"

func! s:gruvbit_setup() abort
    hi Comment gui=italic cterm=italic
    hi Statement gui=bold cterm=bold
    hi VertSplit guibg=NONE ctermbg=NONE
  endfunc

augroup gruvbit-overrides
  autocmd!
  autocmd ColorScheme gruvbit call s:gruvbit_setup()
  " autocmd ColorScheme gruvbit call ChangeLightlineColorscheme('gruvbox_material')
augroup END

" set bg=dark
" let g:ayucolor="light"
" let g:lightline.colorscheme = "mountaineer"
" colo mountaineer

silent! exe 'set background='.$NVIM_COLORSCHEME_BG
silent! exe 'colorscheme '.$NVIM_COLORSCHEME

" if g:colors_name == "darcula"
"   call darcula#Hi('rubySymbol', darcula#palette.constant)
" endif

" if g:colors_name == "iceberg"
"   let $FZF_DEFAULT_OPTS= '--color=fg:#33374c,bg:#e8e9ec,hl:#7759b4 --color=fg+:#33374c,bg+:#d8d9dc,hl+:#7759b4 --color=info:#33374c,prompt:#668e3d,pointer:#7759b4 --color=marker:#7759b4,spinner:#2d539e,header:#668e3d'
" end

map <F1> :colorscheme gruvbox<CR>
map <F2> :colorscheme PaperColor<CR>
map <F3> :colorscheme apprentice-original<CR>
map <F4> :colorscheme hybrid_material<CR>
map <F5> :colorscheme hybrid_reverse<CR>
map <F6> :colorscheme jellybeans<CR>
map <F7> :colorscheme spacegray<CR>
map <F8> :colorscheme nightfly<CR>

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

set updatetime=500
