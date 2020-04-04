#
# Useful shell aliases / convenience functions
#

alias l=exa
alias ll='exa -l'


# git branch (interactive)
gb() {
  local branches selection branch
  branches=$(git branch --sort=-committerdate -vv) &&
    selection=$(echo "$branches" | fzf --height=20% +m) &&
    branch=$(echo "$selection" | awk '{print $1}' | sed "s/.* //") &&
    if [[ -t 1 ]]; then git checkout "$branch"; else echo $branch; fi
}

# git commit --fixup (interactive)
gcf() {
  local commits selection commit
  commits=$(git log --pretty=format:'%h [%ad] %s' --date=relative master..HEAD) &&
    selection=$(echo "$commits" | fzf --height=20% +m) &&
    commit=$(echo "$selection" | awk '{print $1}') &&
    if [[ -t 1 ]]; then git commit --fixup "$commit"; else echo $commit; fi
}

# git new (simplified git start)
gn() {
  git checkout master && git pull --rebase --no-tags && git checkout -b "$1"
}

# git roost (simplified git sync)
gr() {
  local br
  br="$(git rev-parse --abbrev-ref HEAD)"
  git checkout master && git pull --rebase --no-tags && git checkout "$br" && git rebase master
}

alias g='git'
alias ga='git add'
alias gam='git commit --amend -C HEAD'
alias gau='git add --update'
alias gap='git add --patch'
alias gc='git commit'
alias gca='git commit -a'
alias gcA='git commit --amend'
alias gcm='git commit -m'
alias gcam='git commit -am'
alias gco='git checkout'
alias gcp='git cherry-pick'
alias gcr='git rebase -i --autosquash'
alias gcrm='gcr master'
alias gd='git diff'
alias gds='git diff --staged'
alias gl="git log --pretty='format:%C(yellow)%h %C(green)%ad %Creset%s%Cblue  [%an]' --decorate --date=relative"
alias gll='gl --stat'
alias glm='gl master..HEAD'
alias glu='gl @{upstream}..HEAD'
alias gp='git pull --rebase --no-tags'
alias gpr='git pull-request'
alias gdpr='git draft-pull-request'
alias gs='git status'
alias gsh='git show'
alias gS='git stash'
alias gSp='git stash pop'
alias gSs='git stash show'
alias grc='git add --update && git rebase --continue'
alias gre='git reset'
alias greh='git reset HEAD'
alias gre1='git reset HEAD~'
alias gu='git push'
alias gus='git shove'
alias ship='git shove && git pull-request'
