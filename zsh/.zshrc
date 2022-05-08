source "$HOME/.zsh/abbreviations.zsh"

# Edit the current command line in $EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line

# poetry
fpath+=~/.zfunc

# ZSH auto-complete
autoload -Uz compinit; compinit

if (( ! ${fpath[(I)/usr/local/share/zsh-completions]} )); then
  FPATH=/usr/local/share/zsh-completions:$FPATH
fi

# fuzzy search keybinds
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ZSH autosuggest
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# theme
autoload -U promptinit; promptinit
prompt pure
prompt_newline='%666v'
PROMPT=" $PROMPT"

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

export PATH="/usr/local/opt:$PATH"

# Rust
. "$HOME/.cargo/env"

# llvm
export PATH="/usr/local/opt/llvm/bin:$PATH"

export CC=clang
export CXX=clang++
export LD=ld.lld
export AR=llvm-ar
export RANLIB=llvm-ranlib

export CC=clang
export CXX=clang++
export LD=ld.lld
export AR=llvm-ar
export RANLIB=llvm-ranlib

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

alias cc=$CC
alias c++=$CXX
alias ld=$LD
alias ar=$AR
alias ranlib=$RANLIB

. /usr/local/opt/asdf/libexec/asdf.sh
export PATH="/usr/local/sbin:$PATH"

export PATH="$PATH:$HOME/.local/bin"

export PATH="$PATH:$HOME/.dotnet/tools"

SECRETS=$HOME/.env_secrets.sh
if [[ -f "$SECRETS" ]]; then
    source $SECRETS
fi
