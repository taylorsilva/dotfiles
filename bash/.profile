# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# This file is for things NOT related to bash, like loading environment variables

# set PATH so it includes user's private bin directories
if [ -d "$HOME/bin" ]; then
	export PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ]; then
	export PATH="$HOME/.local/bin:$PATH"
fi
