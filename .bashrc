#
# ~/.bashrc
#
# monitor = wlr-randr --output HDMI-A-1 --mode 1920x1080@24.000000Hz

# Kitty 
# eval $(kitty +kitten shell-integration)

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Wallpaper
# swaybg -o '*' -i ~/Downloads/tapeta.jpg -m fill &

# basic stuff
alias ls='ls --color=auto'
alias vim='nvim'
# alias ll='ls -all'
alias grep='grep --color=auto'
alias info='info --vi-keys'

alias fixmonitor='wlr-randr --output HDMI-A-1 --mode 1920x1080@24.000000Hz'

alias battery='upower -i /org/freedesktop/UPower/devices/battery_BAT0'

alias vbm='VBoxManage'

# System maitenance
alias browsepacman='pacman -Qq | fzf --preview "pacman -Qil {}" --layout=reverse --bind "enter:execute(pacman -Qil {} | less)"'
alias czyszczenie='ncdu'

# shows if there are no glob matches
# shopt -s failglob

upto ()
{
    if [ -z "$1" ]; then
        return
    fi
    local upto=$1
    cd "${PWD/\/$upto\/*//$upto}"
}

_upto()
{
    local cur=${COMP_WORDS[COMP_CWORD]}
    local d=${PWD//\//\ }
    COMPREPLY=( $( compgen -W "$d" -- "$cur" ) )
}
complete -F _upto upto

jd(){
    if [ -z "$1" ]; then
        echo "Usage: jd [directory]";
        return 1
    else
        cd **"/$1"
    fi
}

# pythonowo
alias aii='source ~/Uni/venv_ai/bin/activate'
alias py='python'
alias pytea='python ~/Programs/bin/pytea.py '
alias nop='jupyter lab'
alias ucz='cd /home/adziw/Uni/machine_learning/uczenie_maszynowe/ && aii && nop'
alias ve='source venv/bin/activate'
alias vai='source ~/Uni/.venv/bin/activate'

alias dosi='cd ~/studia/si && source .venv/bin/activate'

# git aliases
alias gp='git push'
alias ga='git add .'
alias gcm='git commit -m'

# kubernetes
alias kubdock='eval $(minikube -p minikube docker-env)'
alias pods='kubectl get pods'

# fram
alias dblf='rlwrap dbl'
alias framdoc='./_build/default/src/Doc/framdoc.exe'

PS1='[\u@\h \W]\$ '
. "$HOME/.cargo/env"

# pnpm
export PNPM_HOME="/home/adziw/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export PATH="$HOME/.local/bin:$PATH"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init --path)"
# eval "$(pyenv init -)"

# Kurs linux - Lista 1, zadanie 1

function _ll {
  ls -lAFbhv --color=always $@ | less -XRF
}
alias ll='_ll'

function _mkcd {
  mkdir -p $1 && cd $1
}
alias mkcd='_mkcd'

alias gentmp='touch "tmp-$(date +%Y%m%d%H%M%S)"'

function _genpwd {
  tr -c -d '3-9A-HJ-NP-Z' </dev/urandom | head -c "$@"
}

function activate_genpwd {
  if [ "$#" -eq 0 ]; then
    _genpwd 26
  else
    _genpwd "$@"
  fi
  echo ""
}
alias genpwd='activate_genpwd'

# xunil sruK

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

[ -f "/home/adziw/.ghcup/env" ] && . "/home/adziw/.ghcup/env" # ghcup-env
. "$HOME/.local/share/../bin/env"

# dotfiles setup
# $ git init --bare ~/.dotfiles
# $ alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
# $ dotfiles config status.showUntrackedFiles no
#
# dotfiles replilcation
# $ git clone --bare <git-repo-url> $HOME/.dotfiles
# $ alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
# $ dotfiles checkout
# $ dotfiles config --local status.showUntrackedFiles no


