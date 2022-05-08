# Adopted from http://stackoverflow.com/questions/28573145/how-can-i-move-the-cursor-after-a-zsh-abbreviation

setopt extendedglob

typeset -A abbrevs

# General aliases
abbrevs=(
    "mdc"  "mkdir -p __CURSOR__ && cd \$_"
    "trash" "mv __CURSOR__ ~/.Trash"
    "quit" "osascript -e 'quit app \"__CURSOR__\"'"
)

if hash exa 2>/dev/null; then
    abbrevs+=(
    "l" 'exa -l --all --group-directories-first --git'
    "ll" 'exa -l --all --all --group-directories-first --git'
    "lt" 'exa -T --git-ignore --level=2 --group-directories-first'
    "llt" 'exa -lT --git-ignore --level=2 --group-directories-first'
    "lT" 'exa -T --git-ignore --level=4 --group-directories-first'
)
else
    abbrevs+=(
    "l" 'ls -lah'
    "ll" 'ls -alF'
    "la" 'ls -A'
)
fi

# Tmux
abbrevs+=(
"tas" "tmux attach-session"
)

# Dotfiles
abbrevs+=(
"cab" "cat ~/.zsh/abbreviations.zsh"
"vab" "nvim ~/.zsh/abbreviations.zsh"
"dof" "cd ~/dotfiles; nvim; cd -"
)

# Homebrew
abbrevs+=(
"br"    "brew"
"bri"   "brew install"
"brui"  "brew uninstall"
"brud"  "brew update"
"brug"  "brew upgrade"
)

# Vim
abbrevs+=(
"vim"  'nvim'
)

# Git aliases
abbrevs+=(
"gar"   "git archive -o __CURSOR__ HEAD"

"gs"   "git status"
"gss"  "git status -sb"


"ga"   "git add"
"gaa"  "git add -A"

"gapc"  "git add -p && git commit -v"
"gapcp" "git add -p && git commit -v && git push -u"

"gc"    "git commit -v"
"gcp"   "git commit -v && git push -u"
"gca"   "git commit --amend -v"
"gcane" "git commit --amend --no-edit"
"gcm"   "git commit -m"
"gcmw"   "git commit -m wip"

"gco"     "git checkout"
"gcom"    "git checkout master"
"gcoh"    "git checkout HEAD"
"gcohd"   "git checkout HEAD --"
"gcohgl"  "git checkout HEAD -- Gemfile.lock"
"gcohglb" "git checkout HEAD -- Gemfile.lock; bundle"
"gcohyly" "git checkout HEAD -- yarn.lock; yarn"
"gcl"     "git clone"
"gclc"    "git clone __CURSOR__ && cd \$(basename \$_)"
"gb"      "git branch"
"gbm"     "git branch -M"
"gbv"     "git branch -vv"
"gba"     "git branch -a"
"gbav"    "git branch -a -vv"
"gbsmd"   "git fetch -p && for branch in \$(git branch -vv | grep ': gone]' | awk '{print \$1}'); do git branch -D \$branch; done"

"gbmd"   'git branch --merged | grep  -v "\*\|master" | xargs -n1 git branch -d'
"gbrmd"  'git branch -r --merged | grep origin | grep -v "\->\|master" | cut -d"/" -f2- | xargs git push origin --delete'

"gd"    "git diff"
"gdm"   "git diff origin/master.."
"gdms"  "git diff origin/master:./"
"gdc"   "git diff --cached"
"gdt"   "git difftool"
"gdh"   "git diff HEAD~1"
"gdsh"  "git diff --stat __CURSOR__ HEAD~1"

"gfo"   "git fetch origin"

"gmnf"  "git merge --no-ff"

"gp"    "git push"
"gpu"   "git push -u"
"gpf"   "git push --force-with-lease"
"gpo"   "git push origin"
"gpod"  "git push origin --delete"

"gl"    "git log"
"glr"   "git log --raw --no-merges"
"glg"   "git log --graph --oneline"

"grb"   "git rebase"
"grbi"  "git rebase -i"
"grba"  "git rebase --abort"
"grbc"  "git rebase --continue"
"grbm"  "git rebase master"
"grbom"  "git rebase origin/master"
"grbim" "git rebase -i master"

"grh"   "git reset --hard"
"grhu"  "git reset --hard @{u}"
"grsm"  "git reset --soft master"

"grlm"  "echo \"behind\\tahead\"; git rev-list --left-right --count master..."

"gchp"  "git cherry-pick"
"gchpc" "git cherry-pick --continue"
"gchpa" "git cherry-pick --abort"

"gsh"  "git show"
"gshh" "git show HEAD"

"gsu"  "git submodule update --init --recursive"
"gsgl" "git submodule -q foreach git pull -q origin master"

"gst"  "git stash"
"gstl" "git stash list"
"gstp" "git stash pop"

"gcb"   "git checkout -b"
)

# Add alias and autocompleteion for hub
type compdef >/dev/null 2>&1 && compdef hub=git
type hub >/dev/null 2>&1 && alias git='hub'

for abbr in ${(k)abbrevs}; do
    alias $abbr="${abbrevs[$abbr]}"
done

magic-abbrev-expand() {
local MATCH
LBUFFER=${LBUFFER%%(#m)[_a-zA-Z0-9]#}
command=${abbrevs[$MATCH]}
LBUFFER+=${command:-$MATCH}

if [[ "${command}" =~ "__CURSOR__" ]]; then
    RBUFFER=${LBUFFER[(ws:__CURSOR__:)2]}
    LBUFFER=${LBUFFER[(ws:__CURSOR__:)1]}
else
    zle self-insert
fi
}

magic-abbrev-expand-and-execute() {
magic-abbrev-expand
zle backward-delete-char
zle accept-line
}

no-magic-abbrev-expand() {
LBUFFER+=' '
}

zle -N magic-abbrev-expand
zle -N magic-abbrev-expand-and-execute
zle -N no-magic-abbrev-expand

bindkey " " magic-abbrev-expand
bindkey "^M" magic-abbrev-expand-and-execute
bindkey "^x " no-magic-abbrev-expand
bindkey -M isearch " " self-insert
