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

alias cat="bat --theme=gruvbox-dark"
alias bat="bat --theme=gruvbox-dark"
alias grep=rg
# alias vim=nvim

alias l="exa -l --all --group-directories-first --git"
alias ll="exa -l --all --all --group-directories-first --git"
alias lT="exa -T --git-ignore --group-directories-first --level=4"
alias llt="exa -lT --git-ignore --group-directories-first --level=2"
alias tree="exa -T --git-ignore --level=2"

alias tas="tmux attach-session"
alias dof="cd ~/dotfiles; nvim; cd -"
# alias gs="git status"
# alias gss="git status -sb"
# alias ga="git add"
# alias gaa="git add -A"
# alias gc="git commit -v"
# alias gca="git commit --amend -v"
# alias gcane="git commit --amend --no-edit"
# alias gcm="git commit -m"
# alias gp="git push"
# alias gl="git log"
# alias glr="git log --raw --no-merges"
# alias glg="git log --graph --oneline"

quit() {
    osascript -e 'quit app "$1"'
}

trash() {
    mv $1 ~/.Trash
}

mdc() {
    mkdir -p $1 && cd $1
}
alias prime="streamlink twitch.tv/theprimeagen best"
