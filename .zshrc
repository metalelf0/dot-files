# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# === omz =====================================================================
export ZSH="/Users/metalelf0/.oh-my-zsh"

plugins=(
  git github rails zsh-syntax-highlighting aws zsh-autosuggestions
)

ZSH_THEME="powerlevel10k/powerlevel10k"

source $ZSH/oh-my-zsh.sh
unalias rg
# === omz =====================================================================



# === pure ====================================================================
# to install pure prompt: npm install --global pure-prompt
# autoload -U promptinit; promptinit
# PURE_PROMPT_SYMBOL=λ
# prompt pure
# === pure ====================================================================



# === NVM =====================================================================
source ~/.zsh-nvm/zsh-nvm.plugin.zsh

autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc
# === NVM =====================================================================



# === pyenv ===================================================================
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
# === pyenv ===================================================================

# === rbenv ===================================================================
eval "$(rbenv init -)"
# === rbenv ===================================================================

# === go    ===================================================================
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"
# === go    ===================================================================
#
# === fzf =====================================================================
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS' --color=fg:#33374c,bg:#e8e9ec,hl:#7759b4 --color=fg+:#33374c,bg+:#d8d9dc,hl+:#7759b4 --color=info:#33374c,prompt:#668e3d,pointer:#7759b4 --color=marker:#7759b4,spinner:#2d539e,header:#668e3d'
# === fzf =====================================================================

# === fasd ====================================================================
eval "$(fasd --init auto)"
# === fasd ====================================================================

# === todo.txt directories ====================================================
export TODO_ACTIONS_DIR=~/Documents/todo/actions
mkdir -p $TODO_ACTIONS_DIR
# === todo.txt ================================================================

# === ssh keys ================================================================
# eval "$(ssh-agent)" 1>/dev/null
# ssh-add -q -K ~/.ssh/pazienti_keys.pem
# ssh-add -q ~/.ssh/id_rsa_pazienti
# ssh-add -q ~/.ssh/id_rsa
# ssh-add -q ~/.ssh/id_rsa_pazienti_xpeppers
# === ssh keys ================================================================


# === colors ================================================================== 
colors() {
  color_vars=$(~/.config/kitty/colors $1)
  # Eval ensures that proper env variables are loaded in real time
  eval ${color_vars}
}
# === colors ================================================================== 


# === other ===================================================================
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.doom.d/:$PATH"
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"
HISTFILE=~/.zsh_history
source ~/.aliases.sh
source ~/.sensible-env.sh

# useful for kitty terminal
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# fix issues with puma on osx
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
# === other ===================================================================

# === vim-mode ================================================================
# bindkey -v
# autoload -U edit-command-line
# zle -N edit-command-line
# bindkey '^E' edit-command-line         # Opens Vim to edit current command line
# === vim-mode ================================================================

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

fpath+=${ZDOTDIR:-~}/.zsh_functions
