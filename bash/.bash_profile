# Point of bash_profile is to load .profile and .bashrc
if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
fi

if [ -f "$HOME/.profile" ]; then
	. "$HOME/.profile"
fi
