fpath+=~/.zfunc
source "$HOME/.zsh/alias.zsh"
setopt autocd

# editing
bindkey -e
export EDITOR=nvim
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line

# theme
autoload -U promptinit; promptinit
export CLICOLOR=1
prompt pure
prompt_newline='%666v'
PROMPT=" $PROMPT"
RPROMPT='%F{white}%*'

# ZSH
ZSH_DISABLE_COMPFIX="true"
HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=6"

# Homebrew
export HOMEBREW_AUTO_UPDATE_SECS=604800

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ZSH auto-complete
autoload -Uz compinit; compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# ZSH autosuggest
source "$HOME/.local/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

export PATH="$HOME/.local/bin:$PATH"
export OPENSSL_DIR="$HOME/.local/opt/openssl"
export PATH="$PATH:/Users/miguelaht/.dotnet/tools"
export DOTNET_HOST_PATH="/usr/local/share/dotnet/dotnet"

eval "$(direnv hook zsh)"

# opam configuration
[[ ! -r /Users/miguelaht/.opam/opam-init/init.zsh ]] || source /Users/miguelaht/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
