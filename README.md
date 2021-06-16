# Dotfiles

To use them do the following:

1. Clone this repo into your home directory:

```bash
git clone git@github.com:taylorsilva/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
git submodule update --init
```

1. Make sure `GNU stow` is installed:

```bash
# Mac
brew install stow

# Ubuntu/Debian
sudo apt install stow
```

1. Depending on which directories you plan to use there may be other
setup instructions to follow. Check the `README.md` inside each folder.

1. Use `stow` to create symlinks in your home directory

```bash
cd ~/.dotfiles
stow bash neovim git #any other folders, separated by spaces
```

---

Other stuff to install
- Fira Code font (enable ligatures) - https://github.com/tonsky/FiraCode
- Alternative unix tools - https://github.com/ibraheemdev/modern-unix
