" Unite
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <leader><Leader> :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
" nnoremap <leader>f :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
nnoremap <leader>b :<C-u>Unite -no-split -buffer-name=buffer  buffer<cr>
nnoremap <leader>s :<C-u>Unite -buffer-name=grep grep<cr>

" Ignore
call unite#custom#source('file_rec/async,file', 'ignore_pattern', 'tmp\|bower_components\|dist\|fonts\|node_modules\|maps\|\.png$\|\.jpg$\|\.svg$\|\.gif$')

" Configure Ag and use it instead of grep
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts =
\ '--line-numbers --nocolor --nogroup --hidden --ignore ' .
\  '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
let g:unite_source_grep_recursive_opt = ''
