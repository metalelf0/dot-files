set t_Co=256
set go-=T
filetype plugin indent on
syn on

call pathogen#runtime_prepend_subdirectories(expand('~/.vimbundles'))

set tabstop=2      " a tab is 2 spaces
set smarttab       " insert tab at BOL based on shiftwidth, not tabstop
set shiftwidth=2   " number of spaces to use for autoindenting
set autoindent     " always auto indent code
set expandtab      " use spaces instead of tabs
set hidden         " stop vim complaining about unsaved files when switching buffers
set number         " always display line number
set shiftround     " use multiple of shiftwidth when indenting with '<' and '>'
set hlsearch       " highlight search terms
set incsearch      " search as you type
set nobackup       " stop using backups
set noswapfile     " and stop using swapfiles!

set tags=./ctags;
set cpoptions+=$   " put a $ marker to show where I am changing text
map <Leader>e :e <C-R>=expand("%:p:h") . '/'<CR>
map <Leader>s :split <C-R>=expand("%:p:h") . '/'<CR>
map <Leader>v :vnew <C-R>=expand("%:p:h") . '/'<CR>
syntax on
noremap <silent> ,h :wincmd h<cr>
noremap <silent> ,j :wincmd j<cr>
noremap <silent> ,k :wincmd k<cr>
noremap <silent> ,l :wincmd l<cr>
noremap <silent> ,cj :wincmd j<cr>:close<cr>
noremap <silent> ,ck :wincmd k<cr>:close<cr>
noremap <silent> ,ch :wincmd h<cr>:close<cr>
noremap <silent> ,cl :wincmd l<cr>:close<cr>
noremap <silent> ,cc :close<cr>
noremap <silent> ,ml <C-W>L
noremap <silent> ,mk <C-W>K
noremap <silent> ,mh <C<silent> ,l :wincmd l<cr>
noremap <silent> ,cj :wincmd j<cr>
colorscheme autumnleaf " sea colorscheme sucks with CSApprox
command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
  let isfirst = 1
  let words = []
  for word in split(a:cmdline)
    if isfirst
      let isfirst = 0  " don't change first word (shell command)
    else
      if word[0] =~ '\v[%#<]'
        let word = expand(word)
      endif
      let word = shellescape(word, 1)
    endif
    call add(words, word)
  endfor
  let expanded_cmdline = join(words)
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1, 'You entered:  ' . a:cmdline)
  call setline(2, 'Expanded to:  ' . expanded_cmdline)
  call append(line('$'), substitute(getline(2), '.', '=', 'g'))
  silent execute '$read !'. expanded_cmdline
  1
endfunction
ca shell Shell
autocmd filetype css setlocal equalprg=csstidy\ -\ --silent=true 
" markdown specific configuration
augroup mkd
autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:&gt;
augroup END
if has('gui_running')
  if has("gui_macvim")
    macmenu &File.New\ Tab key=<nop>
    map <D-t> :CommandT<CR>
  endif
  colorscheme sea
  set guioptions-=r
  set lines=100 columns=400
  set guifont=Liberation_Mono_Regular:h12.00 " For GUI options
endif
