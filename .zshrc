if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [[ $1 == eval ]]
then
    "$@"
set --
fi

setopt correct
setopt extendedglob
setopt nocaseglob
setopt rcexpandparam
setopt nocheckjobs
setopt numericglobsort
setopt nobeep
setopt appendhistory
setopt histignorealldups
setopt autocd
setopt inc_append_history
setopt histignorespace

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' rehash true
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
HISTFILE=~/.zhistory
HISTSIZE=10000
SAVEHIST=10000
WORDCHARS=${WORDCHARS//\/[&.;]}

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
autoload edit-command-line
zle -N edit-command-line

# Color man pages
export LESS_TERMCAP_mb=$'\E[01;32m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;47;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'
export LESS=-R

export MANGOHUD_CONFIGFILE=~/.config/mango.conf

alias vim='nvim'
alias diff='nvim -d'
alias journalclear='doas journalctl --vacuum-size=100M'
alias packages='pacman -Qei | awk "/^Name/ { name=\$3 } /^Groups/ { if ( \$3 != \"base\" && \$3 != \"base-devel\" ) { print name } }"'
alias c='clear; neofetch'
alias ls='exa -lh --icons --group-directories-first --git'
alias la='exa -alh --icons --group-directories-first --git'
alias lx='exa -FHSUaghilmu@ --group-directories-first --icons --git'
alias tree='exa -alhT --group-directories-first --git'
alias search='doas fzf'
alias repo='cd ~/Documents/git/'
alias cdd='cd $(find $HOME/ -type d | fzf --scheme=path --reverse --preview="exa -alh --icons --group-directories-first --git {}")'
alias uname='uname -snrmo'
alias dmount='dmenumount'
alias dumount='dmenuumount'
alias config='dotfiles -c edit'
alias gfzf='git log --pretty=oneline | awk "{\$1=\"\";print}" | fzf -m --reverse --no-sort'
alias ntop='doas tcptrack -i $ETH'
alias nscan='doas nmap -A'
alias windows='export DISPLAY=:0.0; wmctrl -l'
alias cp="cp -i"
alias df='df -h'
alias free='free -m'
alias gitu='git add . && git commit && git push'
alias work='VIMWORKDIR=$(find $HOME/Documents/work -type d -name .git | fzf | sed "s/\.git//g") ; cd $VIMWORKDIR ; vim $VIMWORKDIR'

alias dotfiles='$HOME/.bins/dotfiles'

alias grafana='$HOME/Documents/work/docker/run_grafana'

## Keybindings section
bindkey '^[[2~' overwrite-mode
bindkey '^[[3~' delete-char
bindkey '^[[C'  forward-char
bindkey '^[[D'  backward-char
bindkey '^[Oc' forward-word
bindkey '^[Od' backward-word
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word
bindkey '^H' backward-kill-word
bindkey '^[[Z' undo
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down
bindkey -v
bindkey -M vicmd e edit-command-line

# Theming section  
autoload -U compinit colors zcalc
compinit -d
colors
cat ~/.cache/wal/sequences
source ~/.cache/wal/colors-tty.sh
