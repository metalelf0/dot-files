alias ls='gls --color=always -hF'
alias ll='gls --color=always -lhF'
alias l='gls --color=always -lAhF'
alias cd..="cd .."
alias ssh="ssh -X"
alias ..="cd .."
alias gvim='/usr/local/bin/mvim'
alias mvim='/usr/local/bin/mvim --remote-silent'

alias vim='/usr/local/bin/mvim -v'
alias rakelite='rake $* 2>/dev/null'
alias vless="/usr/share/vim/vim73/macros/less.sh"
alias vlc='/Applications/VLC.app/Contents/MacOS/VLC'
alias cvlc="vlc -I ncurses"
alias mou="open -a Mou"

# git aliases
alias gb='git branch'
alias gba='git branch -a'
alias gc='git commit'
alias gcam='git commit -am'
alias gcb='git branch | grep \* | cut -d " " -f 2'
alias gco='git checkout'
alias gd="git diff --color"
alias gl='git pull'
alias gp='git push'
alias gpom="git pull origin master"
alias gst='git status'
# my git alias
alias gpp='git pull && git push'

# custom directory aliases
function dir_alias {
  if [ -d "$1" ]
  then
    export $2="$1"
  else
    echo "Directory $1 not found, alias $2 not set"
  fi
}

source $HOME/.dir_aliases.sh

alias bonsole="bundle exec rails console"
alias bails="bundle exec rails"
alias bake="bundle exec rake"
alias berver="bundle exec rails server"
alias bspec="bundle exec rspec"
alias b="bundle exec"

#launch tmux with screen-256-color-bce term profile
alias tmux="TERM=screen-256color-bce tmux"

alias bers="bundle exec rspec spec"
