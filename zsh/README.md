## zsh Configuration

Before `stow`ing these files make sure [`oh-my-zsh`](https://ohmyz.sh/) is already installed.

```bash
$ sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
$ rm ~/.zshrc #if not rm'd then stow won't work later
```

On MacOS you may have an issuew with the default shell not changing. Run this to change the shell:

```
$ chsh -s /bin/zsh
```

Then from the parent directory of this repo you can run:

```bash
stow zsh
```
