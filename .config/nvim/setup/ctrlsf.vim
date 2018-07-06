nmap     <C-F>f <Plug>CtrlSFPrompt

" Input :CtrlSF foo in command line where foo is the current visual selected word, waiting for further input.
vmap     <C-F>f <Plug>CtrlSFVwordPath

" Like <Plug>CtrlSFVwordPath, but execute it immediately.
vmap     <C-F>F <Plug>CtrlSFVwordExec

" Input :CtrlSF foo in command line where foo is word under the cursor.
nmap     <C-F>i <Plug>CtrlSFCwordPath

" Like <Plug>CtrlSFCwordPath, but execute it immediately.
nmap     <C-F>k <Plug>CtrlSFCwordExec

" Like <Plug>CtrlSFCCwordPath, but execute it immediately.
nmap     <C-F>w <Plug>CtrlSFCCwordExec

" Input :CtrlSF foo in command line where foo is the last search pattern of vim.
nmap     <C-F>p <Plug>CtrlSFPwordPath

nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>

