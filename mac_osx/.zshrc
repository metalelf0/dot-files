# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
export ZSH_THEME="robbyrussell-skia"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# export DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(osx rails textmate)

source $ZSH/oh-my-zsh.sh
source $HOME/.aliases.sh
source $HOME/.ricette_rc
source $HOME/.epistore

# Customize to your needs...
export PATH="/usr/local/ElasticLoadBalancing/bin:$PATH"
export AWS_ELB_HOME="/usr/local/ElasticLoadBalancing"
export PATH="/usr/local/ec2-api-tools/bin:$PATH"
export EC2_HOME="/usr/local/ec2-api-tools"
export PATH="/usr/local/RDSCli/bin:$PATH"
export AWS_RDS_HOME="/usr/local/RDSCli"
export PATH="/usr/local/ec2-ami-tools/bin:$PATH"
export EC2_AMITOOL_HOME="/usr/local/ec2-ami-tools"
export PATH="/usr/local/CloudWatch/bin:$PATH"
export AWS_CLOUDWATCH_HOME="/usr/local/CloudWatch"
export PATH="/usr/local/AutoScaling/bin:$PATH"
export AWS_AUTO_SCALING_HOME="/usr/local/AutoScaling"
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home
export NODE_PATH="/usr/local/lib/node:$NODE_PATH"

export PATH=$HOME/bin:$PATH

# zsh integration for rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
__rvm_project_rvmrc
