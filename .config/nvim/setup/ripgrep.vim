" use Ag/Rg for grep if available
if executable('rg') | set gp=rg\ --vimgrep\ --no-heading gfm=%f:%l:%c:%m,%f:%l%m,%f\ \ %l%m|
elseif executable('ag') | set gp=ag\ --nogroup\ --nocolor | endif
com! -nargs=+ -complete=file -bar Rg sil! gr! <args>|cw|redr!|let @/="<args>"|set hls
com! -nargs=+ -complete=file -bar Ag sil! gr! <args>|cw|redr!|let @/="<args>"|set hls
com! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
set grepprg=rg\ --vimgrep

