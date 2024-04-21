alias v="nvim"
alias vim="nvim"
alias g="git"
alias gap="git add -p"
alias d="docker"
alias dc="docker-compose"
alias k="kubectl"
alias ll="ls -lahF"
# mac specific aliases
alias restartwifi='sudo networksetup -setv4off Wi-Fi;sudo  networksetup -setdhcp Wi-Fi'
alias restartbt='sudo kill -9 $(pgrep bluetoothd)'

# https://github.com/sharkdp/bat
if [[ -e $(which bat 2>/dev/null) ]]; then
  alias cat="bat"
  export BAT_STYLE="plain"
  export BAT_PAGER=""
fi
# https://github.com/bootandy/dust
if [[ -x $(which dust 2>/dev/null) ]]; then
  alias du="dust"
fi
# https://github.com/Canop/broot
if [[ -x $(which broot 2>/dev/null) ]]; then
  alias tree="broot"
fi
# https://github.com/sharkdp/fd
if [[ -x $(which fd 2>/dev/null) ]]; then
  alias find="fd"
fi
# https://github.com/BurntSushi/ripgrep
if [[ -x $(which rg 2>/dev/null) ]]; then
  alias grep="rg"
fi

if [[ -x $(which podman 2>/dev/null) ]]; then
  alias docker="podman"
  alias p="podman"
fi
