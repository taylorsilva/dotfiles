# Dotfiles

To use them do the following:

1. Clone this repo into your home directory:

```bash
git clone git@github.com:taylorsilva/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
git submodule update --init
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

---

I like to use [bash-it](https://github.com/Bash-it/bash-it#installation). When installing, make sure to use the `--no-modify-config` flag. The bash dotfiles already have bash-it configuration in them.

```bash
git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
~/.bash_it/install.sh --no-modify-config
```
