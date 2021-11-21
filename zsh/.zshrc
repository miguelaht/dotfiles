# Edit the current command line in $EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line

# ZSH auto-complete
autoload -Uz compinit; compinit

if (( ! ${fpath[(I)/usr/local/share/zsh-completions]} )); then
  FPATH=/usr/local/share/zsh-completions:$FPATH
fi

# theme
autoload -U promptinit; promptinit
prompt pure

# colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# ZSH
ZSH_DISABLE_COMPFIX="true"
HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=5"

# Homebrew
export HOMEBREW_AUTO_UPDATE_SECS=604800

# LLVM
export PATH="/usr/local/opt/llvm/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"

# python
PYTHONDONTWRITEBYTECODE="true"
alias pipenv='python -m pipenv'

# Rust
. "$HOME/.cargo/env"

# alias
alias ls='ls -G'
alias ll='ls -lG'

# Git alias
alias gs='git status'
alias gaa='git add -A'
alias gc='git commit'
alias gp='git pull --rebase'
alias gcam='git commit -am'
alias gl='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'

alias batt='ioreg -l -w0 | grep Capacity'
alias vim=nvim

# ZMV
autoload zmv
alias zmv='noglob zmv'
alias zcp='noglob zmv -C'
alias zln='noglob zmv -L'
alias zsy='noglob zmv -Ls'
alias python='python3'

# fuzzy search keybinds
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ZSH autosuggest
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

export PATH="$HOME/.poetry/bin:$PATH"
eval "$(pyenv init -)"

export PATH="/Users/miguelaht/.deta/bin:$PATH"
