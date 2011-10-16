" Vim syntax file
" Language: elf0todo
" Maintainer: Andrea Schiavini <metalelf0@gmail.com>
" Version:  1
" Last Change:  2011 Oct 3
" TODO: Feedback is welcomed.

" Quit when a syntax file is already loaded.
if exists("b:current_syntax")
  finish
endif

if !exists("main_syntax")
  let main_syntax = 'elf0todo'
endif

syn match newTodo        /^\[\s\+\].*$/
syn match inProgressTodo /^\[\.\+\].*$/
syn match completedTodo  /^\[X\+\].*$/

hi def link newTodo                    String
hi def link completedTodo              Comment
hi def link inProgressTodo             Special

let b:current_syntax = "elf0todo"
