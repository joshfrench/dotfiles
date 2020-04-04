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
