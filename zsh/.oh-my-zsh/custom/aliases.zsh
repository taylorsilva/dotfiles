alias v="nvim"
alias vim="nvim"
alias g="git"
alias gap="git add -p"
alias d="docker"
alias dm="docker-machine"
alias dc="docker-compose"
alias k="kubectl"
alias ll="ls -lahF"
# mac specific aliases
alias restartwifi='sudo networksetup -setv4off Wi-Fi;sudo  networksetup -setdhcp Wi-Fi'
alias restartbt='sudo kill -9 $(pgrep bluetoothd)'

# https://github.com/sharkdp/bat
if [[ -x $(which bat) ]]; then
  alias cat="bat"
fi
# https://github.com/bootandy/dust
if [[ -x $(which dust) ]]; then
  alias du="dust"
fi
# https://github.com/Canop/broot
if [[ -x $(which broot) ]]; then
  alias tree="broot"
fi
# https://github.com/sharkdp/fd
if [[ -x $(which fd) ]]; then
  alias find="fd"
fi
# https://github.com/BurntSushi/ripgrep
if [[ -x $(which rg) ]]; then
  alias grep="rg"
fi
