" ------------------------------------ ALE ------------------------------------

let g:ale_pattern_options = {
\   '.*db/schema.rb$': {'ale_enabled': 0}
\}

let g:ale_sign_error = '⨉'
let g:ale_sign_warning = '⚠'
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '']
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_save = 1
let g:ale_lint_on_enter = 1
" cycle through location list
" nmap <silent> <leader>n <Plug>(ale_next_wrap)

let g:ale_linters = {
\   'elixir': [],
\}

let g:ale_fixers = {
\   'ruby': [
\       'rubocop',
\       'rufo'
\   ]
\}

let g:ale_rust_cargo_use_check = 1
