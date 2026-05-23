# Enable Powerlevel10k instant prompt (speeds up loading)
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Load Powerlevel10k Theme
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# Basic History Settings
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory sharehistory incappendhistory

# Load Advanced Tab Completions
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Load Plugins (Must be loaded in this specific order)
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Load Powerlevel10k Config Wizard if it exists
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Initialize Fast Node Manager (fnm)
eval "$(fnm env --use-on-cd)"

# -------------------------------------------------------------------
# Modern CLI Tool Aliases
# -------------------------------------------------------------------

# Replace ls with eza (with icons, colors, and smart groupings)
alias ls='eza --color=always --group-directories-first'
alias ll='eza -lh --color=always --group-directories-first --git'
alias la='eza -aH --color=always --group-directories-first'
alias l='eza -lah --color=always --group-directories-first --git'
alias tree='eza --tree'

# Replace cat with bat (adds syntax highlighting and line numbers)
# We use '--style=plain' for plain cat, and keep full headers for 'bat'
alias cat='bat --style=plain --pager=never'
alias preview='bat'

# Search aliases using fd (much faster than 'find')
alias find='fd'
alias hidden-find='fd --hidden --no-ignore'

# -------------------------------------------------------------------
# Bonus Quality-of-Life System Aliases
# -------------------------------------------------------------------
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias mkdir='mkdir -p'
alias update='paru -Syu' # One command to update system + AUR
alias pn="pnpm"
alias vim="nvim"
