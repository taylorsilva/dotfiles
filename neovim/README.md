## Install Neovim (Linux)

On any Linux system the following should work:

```
curl -OL https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
tar xzf nvim-linux64.tar.gz
sudo cp -r ./nvim-linux64/* /usr/local/
```

## Neovim Configuration

Install vim-plug and then install the plugins:

```bash
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

```bash
nvim +PlugInstall +qa
```

### vim-plug cheat sheet

All changes should be made in the `init.vim` file.

To install new plugins after you add them to `init.vim` run `nvim +PlugInstall +qa`

### Troubleshooting

Run the `:checkhealth` command.
