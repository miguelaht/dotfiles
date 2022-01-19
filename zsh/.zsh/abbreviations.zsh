# Adopted from http://stackoverflow.com/questions/28573145/how-can-i-move-the-cursor-after-a-zsh-abbreviation

setopt extendedglob

typeset -A abbrevs

# General aliases
abbrevs=(
  "ls"   "ls -G"
  "ll"   "ls -lG"
  "mdc"  "mkdir -p __CURSOR__ && cd \$_"
  "killsshtty" 'kill $(ps auxww | grep ssh | grep tty| awk "{print \$2}")'
  "kp" 'sudo kill $(ps auxww | grep ssh | grep -e "^pair" | awk "{print \$2}") ; chmod 770 /tmp/tmux-501'
  "jsun" "python -mjson.tool"
  "pag" 'ps auxww | grep'
  "fdg" "find . | grep"
  "pgr" "| grep"
  "awkp" "| awk '{print \$__CURSOR__}'"
  "tstamp" "| while read line; do ; echo \$(date | cut -f4 -d ' ') \$line; done"
  "rlw"  'readlink $(which __CURSOR__)'
  "wtnoti" "while do; noti; sleep 120; done"
  "wt"     "while; do __CURSOR__; clear; sleep 5; done"
  "wtbb"   "while; do !!; clear; sleep 5; done"
  "ut"     "clear && until __CURSOR__; do sleep 5; done"
  "utbb"   "clear && until !!; do sleep 5; done"
  "epoch" "date +%s"
  "epochms" 'echo $(($(gdate +%s%N)/1000000))'
  "oedm" "osascript -e 'tell application \"System Events\" to tell appearance preferences to set dark mode to not dark mode'"
  "rfs" "refresh_safari"
  "trash" "mv __CURSOR__ ~/.Trash"
  )

# Dotfiles
abbrevs+=(
  "cab" "cat ~/.zsh/abbreviations.zsh"
  "vab" "nvim ~/.zsh/abbreviations.zsh"
  "dof" "cd ~/dotfiles; nvim; cd -"
  "dz" '. ~/.zshrc'
  "sase" "set -a; source .env; set +a"
)

# Homebrew
abbrevs+=(
  "br"    "brew"
  "bri"   "brew install"
  "brui"  "brew uninstall"
  "brl"   "brew list"
  "brs"   "brew search"
  "bro"   "brew options"
  "brud"  "brew update"
  "brug"  "brew upgrade"
  "brod"  "brew outdated"
  "brdoc" "brew doctor"

  "brc"   "brew cask"
  "brci"  "brew cask install"
  "brcz"  "brew cask zap"
  "brcl"  "brew cask list"
  "brcs"  "brew cask search"
)

# Tmux
abbrevs+=(
  "ta"    "tmux -u attach"
  "tan"   "tmux -u attach || tmux -u new -n editor"
  "tda"   "tmux detach -a"
  "tsw"   "tmux split-window"
  "tswrc" "tmux split-window rails c"
  "tswrs" "tmux split-window rails s"
  "tswv"  "tmux split-window nvim"
  "tnw"   "tmux new-window"
  "tnwa"  "tnw; tnws; tnwj; tnwc; tnwm; tnwr; tmux select-window -t 1"
  "tnws"  "tmux new-window -n server rails s"
  "tnwws" "tmux new-window -n server bin/webpack-dev-server \; split-window -v rails s"
  "tnwj"  "tmux new-window -n journal nvim ~/Documents/Notes/\$(date +%Y-%m)-Journal.md \"+/^## \$(date +%d)...\" -c noh"
  "tnwc"  "tmux new-window -n chat weechat"
  "tnwm"  "tmux new-window -n mail mutt"
  "tnwr"  "tmux new-window -n rss newsboat"
  "tnwl"  "tmux new-window -n logs \"while ((1)) { heroku logs -t -r production }\""
  "tnwp"  "tmux new-window -n ping ping 8.8.8.8"

  "tks"   "tmux kill-session"

  "screst"  "sudo chown -R ericboehs:staff /tmp/tmux-501"
  "cr7t"  "chmod -R 777 /tmp/tmux-501"
)

# Docker
abbrevs+=(
  "dk"    "docker"
  "dkrit" "docker run -it"
  "dki"   "docker images"
  "dkig"  "docker images | grep __CURSOR__ | awk '{print \$3}'"
  "dm"    "docker-machine"
  "dmssh" "docker-machine ssh"
  "dc"    "docker-compose"
  "dkbd"  "docker build ."
  "dkbt"  "docker build -t __CURSOR__ ."
  "drid"  "docker rmi -f \$(docker images -q -f \"dangling=true\")"
)

# Vim
abbrevs+=(
  "vim"  'nvim'
)

# Git aliases
abbrevs+=(
  "gs"    "git status -sb"
  "gsl"   "git status"
  "gg"    "git lg"
  "ggm"   "git lg origin/master.."
  "ggh"   "git lg --color | head"
  "ggmh"  "git lg origin/master.. --color | head"
  "ggg"   "git ll"
  "glogmh" "git log --oneline --graph master HEAD"

  "ga"   "git add"
  "gad"  "git add ."
  "gadcp" "git add . && git commit -m 'Auto-commit' && git push"
  "gaud"  "git add -u ."
  "gap"  "git add -p"

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

  "gbr"    "git browse"
  "gbrp"  "git browse -- pulls"
  "gbrpl"  "git browse -- pull/"
  "gbrpr"  "git browse -- pull/\$(git pr list -h \$(git rev-parse --abbrev-ref HEAD) | awk '{print \$1}' | tr -d '#')"
  "gbrb"  "git browse -- branches"
  "gbrby"  "git browse -- branches/yours"

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

  "vgu"  'nvim $(git ls-files --unmerged | cut -f2 | sort -u)'
  "gcdi" "git clean -di"
)

# GitHub aliases
abbrevs+=(
  "ghs"    "gh pr checkout \$(unbuffer gh pr status | tail +4 | fzf --ansi --tac | awk '{print \$1}' | tr -d '#')"
  "ghco"   "gh pr checkout \$(unbuffer gh pr list | tail +4 | fzf --ansi | awk '{print \$1}' | tr -d '#')"
  "ghv"    "gh pr view"
  "ghm"    "gh pr merge"
  "ghd"    "gh pr diff"
  "ghr"    "gh pr review"
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