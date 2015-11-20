alias mou="open -a Mou"
alias a='atom'
alias b='bundle exec'
alias t='todo.sh'

# custom directory aliases
function dir_alias {
  if [ -d "$1" ]
  then
    export $2="$1"
  else
    echo "Directory $1 not found, alias $2 not set"
  fi
}

if [ -f "$HOME/.dir_aliases.sh" ]
then
  source $HOME/.dir_aliases.sh
fi

alias tmux="TERM=screen-256color-bce tmux"
alias nvime="/usr/local/bin/electron /Users/metalelf0/sources/neovim-e"
alias nvima="/Applications/Neovim.app/Contents/MacOS/Neovim"

# remove unneeded stacktrace entries from log output
alias -g clean_stack="2>&1 | sed '\:from /Users/metalelf0/.rbenv:d'"
