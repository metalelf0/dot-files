alias b='bundle exec'

# custom directory aliases
function dir_alias {
  if [ -d "$1" ]
  then
    export $2="$1"
  else
    echo "Directory $1 not found, alias $2 not set"
  fi
}
alias -g mux='tmuxinator start '

# remove unneeded stacktrace entries from log output
alias -g clean_stack="2>&1 | sed '\:from /Users/metalelf0/.rbenv:d'"

alias t=\~/bin/todo.sh\ -d\ ~/.todo/config

# use this right after ps | grep, like:
# ps aux | grep solr | killpid
alias killpid='awk '\''{print $2}'\'' | xargs kill -9'

alias e='nvim-qt . 2>/dev/null &'
alias gcb='git rev-parse --abbrev-ref HEAD'
alias gco='git checkout'
alias gss='git status --short'
alias ls='exa'
alias ls='exa'
alias la='exa -lah'
alias l='exa -lah'
alias nocaps='setxkbmap -option ctrl:nocaps'
alias fullscreen='wmctrl -r :ACTIVE: -b toggle,fullscreen'
alias stw="figlet -d ~/.config/figlet/fonts -f starwars"
# alias last_capybara_screenshot="ls --color=never tmp/capybara/*.png | tail -n 1 | xargs xdg-open"
alias last_capybara_file="ls tmp/capybara/screenshot_*.html | tail -n 1"
alias gfl='git flow'
alias list-fonts='fc-list'
alias setup-keyboard='setxkbmap -option ctrl:nocaps && setxkbmap -option compose:lwin'
alias icat="python3 ~/sources/kitty icat"

if [ -f "$HOME/bin/hub" ]
then
  alias git='hub'
fi

source ~/.pomux.sh
