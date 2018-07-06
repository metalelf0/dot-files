export ZSH=/home/metalelf0/.oh-my-zsh
ZSH_THEME=""
COMPLETION_WAITING_DOTS="true"

plugins=(
  git github rails
)

source $ZSH/oh-my-zsh.sh
unalias rg

HISTFILE=~/.zsh_history
source $HOME/.aliases.sh
source $HOME/.profile
export PATH="$HOME/.rbenv/bin:$PATH"

eval "$(rbenv init -)"
eval "$(fasd --init auto)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

autoload -U promptinit && promptinit
prompt pure

(cat $HOME/.cache/wal/sequences &)

