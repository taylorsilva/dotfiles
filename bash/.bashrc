# Bashrc

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
if [ -e ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

# functions definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_functions, instead of adding them here directly.
if [ -e ~/.bash_functions ]; then
    source ~/.bash_functions
fi

#############################################################################
############################## Export env's ################################
#############################################################################

export VISUAL=vim
export GRADLE_HOME="/Applications/gradle"
export PATH="$GRADLE_HOME/bin:/usr/local/sbin:$PATH"

if [ -e ~/.bash_it ]; then
  # Path to the bash it configuration
  export BASH_IT="/Users/taylor/.bash_it"
  # Lock and Load a custom theme file
  # location /.bash_it/themes/
  export BASH_IT_THEME='modern'
  # Set this to false to turn off version control status checking within the prompt for all themes
  export SCM_CHECK=true
  # Load Bash It
  source "$BASH_IT"/bash_it.sh
fi

# git autocomplete
[ -e /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

if [ -e ~/go ]; then
  export GOPATH=$HOME/go
  export PATH="$HOME/go/bin:$PATH"
fi
export PATH="/usr/local/opt/sqlite/bin:$PATH"
# use go 1.11
export PATH="/usr/local/opt/go@1.11/bin:$PATH"
