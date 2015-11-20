export ZSH=/Users/metalelf0/.oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(osx rails git git-flow)
export PATH="$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
source $ZSH/oh-my-zsh.sh
source $HOME/.aliases.sh
export NVIM_TUI_ENABLE_TRUE_COLOR=1
eval "$(rbenv init -)"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

source /Users/metalelf0/.iterm2_shell_integration.zsh
source /Users/metalelf0/.node_config.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
