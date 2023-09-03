# export CC=clang
# export CXX=clang++
# export LD=ld.lld
# export AR=llvm-ar
# export RANLIB=llvm-ranlib

# export LC_CTYPE=en_US.UTF-8
# export LC_ALL=en_US.UTF-8

alias brew=~/.local/homebrew/bin/brew

# alias cc=$CC
# alias c++=$CXX
# alias ld=$LD
# alias ar=$AR
# alias ranlib=$RANLIB

alias grep=rg
alias vim=nvim

alias ll="ls -l"

alias dof="cd ~/dotfiles; nvim; cd -"

alias -s {js,ts,jsx,tsx,json,yaml,cs,sql,yml,go,rs,sql,toml,html,css,md,env}=cat

quit() {
    osascript -e 'quit app "$1"'
}

trash() {
    mv $1 ~/.Trash
}

mdc() {
    mkdir -p $1 && cd $1
}
