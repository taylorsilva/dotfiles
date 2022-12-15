## zsh Configuration

Before `stow`ing these files make sure [`oh-my-zsh`](https://ohmyz.sh/) is already installed.

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

```bash
rm ~/.zshrc #if not rm'd then stow won't work later
```

On MacOS you may have an issue with the default shell not changing. Run this to change the shell:

```
$ chsh -s /bin/zsh
```

Then from the parent directory of this repo you can run:

```bash
stow zsh
```

---

For local or machine specific changes you can add stuff to `~/.zshrc.local`. That file will be sourced on startup.
