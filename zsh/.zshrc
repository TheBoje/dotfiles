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
  history
  man
)


# zsh-completions
if type brew &>/dev/null; then
	FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

	autoload -Uz compinit
	compinit
else
	autoload -U compinit && compinit
fi

source $ZSH/oh-my-zsh.sh

# L-Acoustics
source $HOME/dotfiles/zsh/.zshrc.lacoustics
if [ -f $HOME/.zshrc.local ]; then
    source $HOME/.zshrc.local
fi

# Plugins related
# colorize
ZSH_COLORIZE_TOOL=pygmentize
# fzf
if type brew &>/dev/null; then
	export FZF_BASE=/opt/homebrew/opt/fzf
else
	export FZF_BASE=/sbin/fzf
fi

source <(fzf --zsh)

# zsh-syntax-highlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

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

# User stuff

# Path
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache

if [[ ! -v XDG_CONFIG_HOME ]];then
    export XDG_CONFIG_HOME=$HOME/.config
fi
export CMAKE_CXX_COMPILER_LAUNCHER=ccache
export CMAKE_EXPORT_COMPILE_COMMANDS=1

alias wget=wget --hsts-file="$XDG_CONFIG_HOME/wget-hsts"

export MAKEFLAGS="-j8"
# Alias
alias cat="bat --color=always --style=plain --theme=Nord"
alias less="cless"
alias ls="eza -l --icons --color always --git"
alias ll="eza -la --icons --color always --git"
alias make="make -j -O -s 2>&1"
alias g="git"
alias gcl="git clone"
alias gpl="git pull"
alias gps="git push"
alias gct="git commit -m"
alias pacman="pacman --color=always"
alias yay="yay --color=always"

alias git-ssh='git remote set-url origin "$(git remote get-url origin | sed -E '\''s,^https://([^/]*)/(.*)$,git@\1:\2,'\'')"'

alias git-https='git remote set-url origin "$(git remote get-url origin | sed -E '\''s,^git@([^:]*):/*(.*)$,https://\1/\2,'\'')"'

# Keybinds
bindkey '^H' backward-kill-word # ctrl+backspace, delete previous word

export GPG_TTY=$(tty)
