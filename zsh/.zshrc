# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="modern"

DISABLE_UPDATE_PROMPT="true"

# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git z)

# enable tab completion for git
autoload -Uz compinit && compinit

# User configuration
export EDITOR='nvim'
export VISUAL='nvim'
export GIT_DUET_ROTATE_AUTHOR=1
export GIT_DUET_CO_AUTHORED_BY=1

# machine specific changes should be made in ~/.zshrc.local
if [ -e ~/.zshrc.local ]; then
  source ~/.zshrc.local
fi

# Add things to PATH
export PATH=$PATH:$HOME/bin

if [[ -d "/usr/local/go/" ]]; then
  export PATH=$PATH:/usr/local/go/bin
fi

if [[ -e $(which go 2>/dev/null) ]]; then
  # If go is installed then set users GOPATH which is where packages/binaries
  # will be installed
  export GOPATH=$HOME/go
  export PATH=$PATH:$GOPATH/bin
fi

if [[ -d "$HOME/.cargo/bin" ]]; then
  export PATH="$HOME/.cargo/bin:$PATH"
  source "$HOME/.cargo/env"
fi

if [[ -e $(which java 2>/dev/null) ]]; then
  java_symlink=$(which java)
  java_path=$(readlink -f ${java_symlink})
  export JAVA_HOME="${java_path%/bin/java}"
  unset java_symlink
  unset java_path
fi

if [[ -d "$HOME/.local/bin" ]]; then
  export PATH="$PATH:$HOME/.local/bin"
fi

if [[ -d "/snap/bin" ]]; then
  export PATH="$PATH:/snap/bin"
fi

if [[ -e $(which terraform 2>/dev/null) ]]; then
    export TF_PLUGIN_CACHE_DIR=$HOME/.terraform.d/plugin-cache
    mkdir -p $HOME/.terraform.d/plugin-cache
fi

if [[ -z "${SSH_AUTH_SOCK}" ]]; then
  eval $(ssh-agent)
fi
ssh-add ~/.ssh/*_key

# Start oh-my-zsh after PATH has been built
source $ZSH/oh-my-zsh.sh

# Will setup PATH and source relevant files
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
