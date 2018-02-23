" write C123 to jump to line 123 of the compiled js
autocmd FileType coffee command! -nargs=1 C CoffeeCompile | :<args>
