let g:ctrlp_working_path_mode = 'ra'

let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore node_modules
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ -g ""'

let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

let g:ctrlp_switch_buffer = 0

" Additional mapping for buffer search
nnoremap <silent> ,b :CtrlPBuffer<cr>
nnoremap <silent> <Leader>pb :CtrlPBuffer<cr>
nnoremap <silent> <Leader>pl :CtrlPLine<cr>

" Cmd-Shift-P to clear the cache
nnoremap <silent> <D-P> :ClearCtrlPCache<cr>

" Idea from : http://www.charlietanksley.net/blog/blog/2011/10/18/vim-navigation-with-lustyexplorer-and-lustyjuggler/
" Open CtrlP starting from a particular path, making it much
" more likely to find the correct thing first. mnemonic 'jump to [something]'
map ,jj :CtrlP app/assets/javascripts<CR>
map ,jS :CtrlP app/assets/stylesheets<CR>
map ,je :CtrlP app/api/entities<CR>
map ,jm :CtrlP app/models<CR>
map ,jc :CtrlP app/controllers<CR>
map ,jv :CtrlP app/views<CR>
map ,jh :CtrlP app/helpers<CR>
map ,jl :CtrlP lib<CR>
map ,jp :CtrlP public<CR>
map ,js :CtrlP spec<CR>
map ,jf :CtrlP fast_spec<CR>
map ,jd :CtrlP db<CR>
map ,jC :CtrlP config<CR>
map ,jV :CtrlP vendor<CR>
map ,jF :CtrlP spec/factories<CR>
