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

source $ZSH/oh-my-zsh.sh

# enable tab completion for git
autoload -Uz compinit && compinit

# User configuration
export EDITOR='nvim'
export VISUAL='nvim'
export GOPATH=$HOME/go
export GIT_DUET_ROTATE_AUTHOR=1
export GIT_DUET_CO_AUTHORED_BY=1

# Add things to PATH
if [ -d "$GOPATH" ]; then
  export PATH=$PATH:$GOPATH/bin
  export GOOS=linux
fi
if [ -d "$GOROOT" ]; then
  export PATH=$PATH:$GOROOT/bin
fi
if [ -d "$HOME/.cargo/bin" ]; then
  export PATH="$HOME/.cargo/bin:$PATH"
  source "$HOME/.cargo/env"
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# machine specific changes should be made in ~/.zshrc.local
if [ -e ~/.zshrc.local ]; then
  source ~/.zshrc.local
fi
