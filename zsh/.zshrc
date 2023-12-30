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

if [[ -d "$HOME/.local/bin" ]]; then
  export PATH="$PATH:$HOME/.local/bin"
fi

if [[ -e $(which terraform 2>/dev/null) ]]; then
    export TF_PLUGIN_CACHE_DIR=$HOME/.terraform.d/plugin-cache
    mkdir -p $HOME/.terraform.d/plugin-cache
fi

if [[ -f "$HOME/.ssh/private_key" ]]; then
  eval $(ssh-agent)
  ssh-add $HOME/.ssh/*_key
fi

# Start oh-my-zsh after PATH has been built
source $ZSH/oh-my-zsh.sh

# Method 1 to enable fzf
if [[ -d $HOME/.fzf/ ]]; then
  source $HOME/.fzf/shell/key-bindings.zsh
  source $HOME/.fzf/shell/completion.zsh
fi

# Method 2 to enable fzf
if [[ -d /usr/share/doc/fzf/examples/ ]]; then
  source /usr/share/doc/fzf/examples/key-bindings.zsh
  source /usr/share/doc/fzf/examples/completion.zsh
fi
