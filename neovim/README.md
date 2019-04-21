## Neovim Configuration

Install vim-plug and then install the plugins:

```
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

nvim +PlugInstall +qa
```

### vim-plug cheat sheet

All changes should be made in the `init.vim` file.

To install new plugins after you add them to `init.vim` run `nvim +PlugInstall +qa`
