" remove deprecated mappings, just use <leader>ww to both yank and paste

let g:windowswap_map_keys = 0 "prevent default bindings
nnoremap <silent> <leader>ww :call WindowSwap#EasyWindowSwap()<CR>

