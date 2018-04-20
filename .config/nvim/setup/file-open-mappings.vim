map <Leader>J :vsplit $HOME/Documents/journal.md<Enter>
map <Leader>A :vsplit $HOME/.config/alacritty/alacritty.yml<Enter>
map <Leader>N :vsplit $HOME/Documents/notes.md<Enter>
map <Leader>T :split $HOME/Documents/todo/todo.txt<Enter>
map <Leader>V :vsplit $MYVIMRC<Enter>
map <Leader>Z :vsplit $HOME/.zshrc<Enter>
map <Leader>I :vsplit $HOME/.i3/config<Enter>

function! LastCapybaraFile()
  :args `ls tmp/capybara/screenshot*.html\| tail -n1`
endfunc
command! -bar LastCapybaraFile call LastCapybaraFile()
