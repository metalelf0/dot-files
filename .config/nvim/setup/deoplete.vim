"" deoplete
"" call remote#host#RegisterPlugin('python3', '/Users/metalelf0/.config/nvim/plugged/deoplete.nvim/rplugin/python3/deoplete.py', [
"  \ {'sync': 1, 'name': '_deoplete', 'opts': {}, 'type': 'function'},
"\ ])
"
"let g:deoplete#enable_at_startup = 1
"let g:deoplete#auto_complete_start_length = 2
"" let g:deoplete#enable_refresh_always=1
"let g:deoplete#enable_ignore_case = 1
"let g:deoplete#file#enable_buffer_path=1
"
"let g:deoplete#sources={}
"let g:deoplete#sources._                 = ['buffer', 'file', 'ultisnips']
"let g:deoplete#sources.ruby              = ['buffer', 'member', 'file', 'tag', 'ultisnips']
"let g:deoplete#sources.vim               = ['buffer', 'member', 'file', 'ultisnips']
"let g:deoplete#sources['javascript.jsx'] = ['buffer', 'member', 'file', 'ultisnips']
"let g:deoplete#sources.css               = ['buffer', 'member', 'file', 'omni', 'ultisnips']
"let g:deoplete#sources.scss              = ['buffer', 'member', 'file', 'omni', 'ultisnips']
"let g:deoplete#sources.html              = ['buffer', 'member', 'file', 'omni', 'ultisnips']
"let g:deoplete#sources.haml              = ['buffer', 'member', 'file', 'tag', 'omni', 'ultisnips']
"let g:deoplete#sources.erb               = ['buffer', 'member', 'file', 'tag', 'omni', 'ultisnips']
"
"" use tab to forward cycle
"inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
"
"" use shift-tab to reverse cycle
"inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
"
"" integration with vim-multiple-cursors
"function! Multiple_cursors_before()
"    let b:deoplete_disable_auto_complete = 1
"endfunction
"
"function! Multiple_cursors_after()
"    let b:deoplete_disable_auto_complete = 0
"endfunction

" Use deoplete.
let g:deoplete#enable_at_startup = 1
let g:monster#completion#rcodetools#backend = "async_rct_complete"
let g:deoplete#sources#omni#input_patterns = {
\   "ruby" : '[^. *\t]\.\w*\|\h\w*::'
\}
call deoplete#custom#set('buffer', 'rank', 501)
