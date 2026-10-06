# Initialize fnm BEFORE instant prompt to prevent console output conflicts
if command -v fnm &>/dev/null; then
  eval "$(fnm env --use-on-cd)"
fi

# Enable Powerlevel10k instant prompt (speeds up loading)
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Load Powerlevel10k Theme
[[ -f /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme ]] &&
  source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# Basic History Settings
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory sharehistory incappendhistory

# Fast Completion Init (Cached to speed up startup)
autoload -Uz compinit
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.m+1) ]]; then
  compinit
else
  compinit -C
fi

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Load Plugins (Safely guarded)
[[ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]] &&
  source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

[[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] &&
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Load Powerlevel10k Config Wizard
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Modern CLI Tool Aliases
alias ls='eza --color=always --group-directories-first'
alias ll='eza -lh --color=always --group-directories-first --git'
alias la='eza -aH --color=always --group-directories-first'
alias l='eza -lah --color=always --group-directories-first --git'
alias tree='eza --tree'

alias cat='bat --style=plain --pager=never'
alias preview='bat'

alias find='fd'
alias hidden-find='fd --hidden --no-ignore'

# Quality-of-Life System Aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias mkdir='mkdir -p'
alias update='paru -Syu'
alias pn="pnpm"
alias vim="nvim"
alias pagekite="pagekite.py"

# PNPM Global Bin Configuration
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
*":$PNPM_HOME/bin:"*) ;;
*) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac
