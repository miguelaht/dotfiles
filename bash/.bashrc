[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/usr/local/opt/llvm/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
. "$HOME/.cargo/env"
