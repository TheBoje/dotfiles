setopt printexitvalue
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="jispwoso"
DISABLE_AUTO_TITLE="true"
HIST_STAMPS="dd.mm.yyyy"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git
  colorize
  fzf
  sudo
  zsh-syntax-highlighting
  zsh-autosuggestions
  zsh-completions
  k
  docker
  docker-compose
  history
  man
  npm
)

source $ZSH/oh-my-zsh.sh

# Plugins related
# colorize
ZSH_COLORIZE_TOOL=pygmentize
# fzf
export FZF_BASE=/sbin/fzf
# zsh-completions
autoload -U compinit && compinit

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# User stuff

# Path
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache
export AndroidSdkDirectory=/home/boj/Android/Sdk/

#export GNUPGHOME=$XDG_DATA_HOME/gnupg
#export LESSHISTFILE=$XDG_CACHE_HOME/less/history
alias wget=wget --hsts-file="$XDG_CONFIG_HOME/wget-hsts"
#export HISTFILE="$XDG_STATE_HOME"/zsh/history

export MAKEFLAGS="-j8"
# Alias
alias cat="bat --color=always --style=plain --theme=Nord"
alias less="cless"
alias ls="exa -l --icons --color always --git"
alias ll="exa -la --icons --color always --git"
alias make="make -j -s 2>&1"
alias g="git"
alias gcl="git clone"
alias gpl="git pull"
alias gps="git push"
alias gct="git commit -m"
alias c="code ."
alias swaylock="swaylock \
  --screenshots \
  --clock \
  --indicator \
  --indicator-radius 100 \
  --indicator-thickness 7 \
  --effect-blur 7x5 \
  --effect-vignette 0.5:0.5 \
  --ring-color bb00cc \
  --key-hl-color 880033 \
  --line-color 00000000 \
  --inside-color 00000088 \
  --separator-color 00000000 \
  --grace 2 \
  --fade-in 0.2"
  alias pacman="pacman --color=always"
  alias yay="yay --color=always"

  alias dc="docker compose"
  alias dcu="docker compose up --remove-orphans"
  alias dcud="docker compose up -d --remove-orphans"
  alias dcd="docker compose down"
  alias dcdr="docker compose down --remove-orphans"
  alias dcps="docker compose ps"
  alias dcl="docker compose logs -f"

  alias git-ssh='git remote set-url origin "$(git remote get-url origin | sed -E '\''s,^https://([^/]*)/(.*)$,git@\1:\2,'\'')"'

  alias git-https='git remote set-url origin "$(git remote get-url origin | sed -E '\''s,^git@([^:]*):/*(.*)$,https://\1/\2,'\'')"'

# Keybinds
bindkey '^H' backward-kill-word # ctrl+backspace, delete previous word

export DOTNET_CLI_TELEMETRY_OPTOUT=1

export GPG_TTY=$(tty)

# opam configuration
[[ ! -r /home/boj/.opam/opam-init/init.zsh ]] || source /home/boj/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

[ -s "/usr/share/scm_breeze/scm_breeze.sh" ] && source "/usr/share/scm_breeze/scm_breeze.sh"
