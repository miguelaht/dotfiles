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
export FZF_DEFAULT_COMMAND="rg --files --max-depth 2 --follow --hidden --glob '!node_modules/*,.git/*'"
export FZF_CTRL_T_OPTS="--preview='bat --style numbers,changes --color=always {} | head -500' --bind ctrl-d:preview-page-down,ctrl-u:preview-page-up --no-height --no-reverse"
export export FZF_ALT_C_COMMAND="fd . -d 3"

# ZSH auto-complete
autoload -Uz compinit; compinit

# ZSH autosuggest
source "$HOME/.local/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

export PATH="$HOME/Library/Python/3.9/bin:$PATH"
export PATH="$PATH:$HOME/.dotnet/tools"
export PATH="$HOME/.local/bin:$PATH"
