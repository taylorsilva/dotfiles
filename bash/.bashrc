# Bashrc - This file contains bash specific configuration (functions, aliases, bash-it stuff, etc.)

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac


#############################################################################
################### Load Aliases & functions ################################
#############################################################################

# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
[ -e ~/.bash_aliases ] && source ~/.bash_aliases

# functions definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_functions, instead of adding them here directly.
[ -e ~/.bash_functions ] && source ~/.bash_functions

[ -e ~/.fzf.bash ] && source ~/.fzf.bash

# git autocomplete
[ -e /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

#############################################################################
############################## Export env's ################################
#############################################################################

export VISUAL=nvim
export GRADLE_HOME="/Applications/gradle"
export PATH="$GRADLE_HOME/bin:/usr/local/sbin:$PATH"
export GOPATH=$HOME/go

if [ -e ~/.bash_it ]; then
  # Path to the bash it configuration
  export BASH_IT="${HOME}/.bash_it"
  # Lock and Load a custom theme file
  # location /.bash_it/themes/
  export BASH_IT_THEME="modern-time"
  # Set this to false to turn off version control status checking within the prompt for all themes
  export SCM_CHECK=true
  # Load Bash It
  source "$BASH_IT"/bash_it.sh
fi


# Add things to PATH
if [ -d "$GOPATH/bin" ]; then
  export PATH=$PATH:$GOPATH/bin
fi
