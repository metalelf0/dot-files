alias b='bundle exec'

alias 'cat=bat'
alias l='exa -lah'
alias la='exa -lah'
alias ls='exa'
alias lsd="ls -la --sort=date"
alias hide_desktop_icons="defaults write com.apple.finder CreateDesktop false; killall Finder"
alias show_desktop_icons="defaults write com.apple.finder CreateDesktop true; killall Finder"
alias dcu="docker-compose up"
alias dcub="docker-compose up --build"
alias lg="lazygit"

# custom directory aliases
function dir_alias {
  if [ -d "$1" ]
  then
    export $2="$1"
  else
    echo "Directory $1 not found, alias $2 not set"
  fi
}

# if [ -f "$HOME/.dir_aliases.sh" ]
# then
#   source $HOME/.dir_aliases.sh
# fi


# remove unneeded stacktrace entries from log output
alias -g clean_stack="2>&1 | sed '\:from /Users/metalelf0/.rbenv:d'"

alias gcb='git rev-parse --abbrev-ref HEAD'

function log_pomo_event {
  echo "$1: `LC_ALL=it_IT date +'%H:%M - %A %d %B'`" >> ~/pomodori_log.txt
}

function pomodoro {
  terminal-notifier -title '🍅 Pomodoro' -message 'Pomodoro iniziato'
  echo "`date +'%H:%M:%S'`" > /tmp/current_pomodoro_start
  log_pomo_event 'Inizio pomodoro: '"$1"
  say -v Ava 'Pomodoro started'
  tty-countdown -m 25
  # tty-countdown -m 25  -f /Users/metalelf0/sources/tty-countdown/font.txt
  say -v Ava 'Pomodoro completed'
  terminal-notifier -title '🍅 Pomodoro' -message 'Pomodoro completato'
  echo > /tmp/current_pomodoro_start
  log_pomo_event 'Fine pomodoro'
}

function pausa {
  terminal-notifier -title '⏰ Pausa' -message 'Pausa iniziata'
  log_pomo_event 'Inizio pausa'
  say -v Ava 'Break started'
  tty-countdown -m 5
  say -v Ava 'Break completed'
  terminal-notifier -title '⏰ Pausa' -message 'Pausa completata'
  log_pomo_event 'Fine pausa'
}

function pausalunga {
  terminal-notifier -title '⏰ Pausa lunga' -message 'Pausa lunga iniziata'
  log_pomo_event 'Inizio pausa lunga'
  say -v Ava 'Long break started'
  tty-countdown -m 15
  say -v Ava 'Long break completed'
  terminal-notifier -title '⏰ Pausa lunga' -message 'Pausa lunga completata'
  log_pomo_event 'Fine pausa lunga'
}

function pausapranzo {
  terminal-notifier -title '⏰ Pausa pranzo' -message 'Pausa pranzo iniziata'
  log_pomo_event 'Inizio pausa pranzo!'
  say -v Ava 'Enjoy your meal, bitch!'
  tty-countdown -m 90
  say -v Ava 'Get back to work, bitch!'
  terminal-notifier -title '⏰ Pausa pranzo' -message 'Pausa pranzo completata'
  log_pomo_event 'Fine pausa pranzo'
}

function nagger {
  while true
  do
    if [[ `ps | rg "(tty-countdown|pomonode)" | rg -v " rg "` ]]
    then
      echo "Something is running, good..."
    else
      terminal-notifier -title 'Hey hey hey' -message 'Are you slacking off? Start a timer!'
    fi
    sleep 60
  done
}

function n {
  if [ $1 ]
  then
    echo "`date +'%d/%m/%y - %H:%M:%S'`: $*" >> ~/Documents/notes.md
  else
    grep "`date +'%d/%m/%y'`" ~/Documents/notes.md
  fi
}

function amethyst_narrow {
  export AMETHYST_PADDING=800
  amethyst_padding $AMETHYST_PADDING
}

function amethyst_wide {
  export AMETHYST_PADDING=25
  amethyst_padding $AMETHYST_PADDING
}

function amethyst_narrower {
  export AMETHYST_PADDING=$(($AMETHYST_PADDING + 100))
  amethyst_padding $AMETHYST_PADDING
}

function amethyst_wider {
  export AMETHYST_PADDING=$(($AMETHYST_PADDING - 100))
  amethyst_padding $AMETHYST_PADDING
}

function amethyst_padding {
  if [ $1 ]
  then
    defaults write com.amethyst.Amethyst screen-padding-left -int $1
    defaults write com.amethyst.Amethyst screen-padding-right -int $1
  fi
}

function kill_rails {
  if [ $1 ]
  then
    lsof -i TCP:$1 | grep ruby | grep IPv4 | awk '{print $2}' | xargs kill -9
  else
    echo "Syntax: kill_rails <PORT>"
  fi
}

alias glNoGraph='git log --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr% C(auto)%an" "$@"'

# fbr: list git branches
function fbr {
  local branches branch
  branches=$(git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format="%(refname:short)") &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

# fshow_preview - git commit browser with previews
function fshow_preview {
    glNoGraph | fzf --no-sort --reverse --tiebreak=index --no-multi \ --ansi --preview="$_viewGitLogLine" \ --header "enter to view, alt-y to copy hash" \ --bind "enter:execute:$_viewGitLogLine   | less -R" \ --bind "alt-y:execute:$_gitLogLineToHash | xclip"
}

# alacritty neovim
anvim() {
  local target="${PWD}"
  if [ -n "${1}" ]; then
    target=$(realpath "$1")
  fi

  local wdir="${target}"
  if [ -f "${target}" ]; then
    wdir=$(dirname "${target}")
  fi

  echo "Wdir is $wdir"

  nohup alacritty \
    --working-directory "${wdir}" \
    -t "nvim - ${target}" \
    -e $SHELL -lc "nvim ${target}" >/dev/null &
}
