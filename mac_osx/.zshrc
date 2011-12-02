# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="robbyrussell.light"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin:/usr/X11/bin:/Users/metalelf0/Desktop/android-sdk-mac/tools:/Users/metalelf0/bin:/opt/local/bin:/opt/local/sbin:/usr/local/jruby-1.3.1/bin:/Users/metalelf0/.gem/ruby/1.8/bin
# paths for EC2 commands
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

export JAVA_HOME='/System/Library/Frameworks/JavaVM.framework/Home'
export ANT_HOME='/Developer/Java/ant'
alias epi='cd ~/Documents/Sourcesense/epi/episrl/epistore/trunk'
alias gvim='/Applications/MacVim.app/Contents/MacOS/Vim'
[[ -s "$HOME/.rvm/scripts/rvm" ]] && \. "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.
