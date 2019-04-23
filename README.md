# Dotfiles

To use them do the following:

1. Clone this repo into your home directory:

```bash
git clone git@github.com:taylorsilva/dotfiles.git ~/.dotfiles
```

2. Make sure `GNU stow` is installed:

```bash
# Mac
brew install stow

# Ubuntu/Debian
sudo apt install stow
```

3. Use `stow` to create symlinks in your home directory

```bash
cd ~/.dotfiles
stow bash neovim git #any other folders, separated by spaces
```
