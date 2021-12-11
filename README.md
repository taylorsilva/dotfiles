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

## Other stuff to install
- Fira Code font (enable ligatures) - https://github.com/ryanoasis/nerd-fonts/releases/ (Search for `Firacode`)
- Alternative unix tools - https://github.com/ibraheemdev/modern-unix
- https://github.com/koalaman/shellcheck/

## Firefox

Addons to install:
- https://github.com/gorhill/uBlock
- https://addons.mozilla.org/en-US/firefox/addon/sidebery/
- https://addons.mozilla.org/en-US/firefox/addon/bitwarden-password-manager/
- https://addons.mozilla.org/en-US/firefox/addon/clearurls/

### Hide Firefox's Native Tabs

1. `about:config` and change `toolkit.legacyUserProfileCustomizations.stylesheets` to `true`
1. `about:profiles` and open the **Root Directory** in your file manager
1. Create a folder called `chrome` inside that directory and then a file called `userChrome.css` inside the new folder. Populate `userChrome.css` with the following:

```css
/* hides the native tabs */
#TabsToolbar {
  visibility: collapse;
}
```
Go back to Firefox's `about:profiles` page and press the `Restart Normally...` button for changes to take effect.
