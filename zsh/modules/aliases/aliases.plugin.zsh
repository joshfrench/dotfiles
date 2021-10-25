alias l=exa
alias ll='exa -l'
alias tmux='env TERM=screen-256color tmux'
alias vim=nvim
alias tf=terraform
alias diff=colordiff
alias cat=bat
alias chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'
alias koff='kubectl config unset current-context'

# git branch (interactive)
function gb() {
  local branches selection branch
  branches=$(git branch --sort=-committerdate -vv) &&
    selection=$(echo "$branches" | fzf --height=20% +m) &&
    branch=$(echo "$selection" | awk '{print $1}' | sed "s/.* //") &&
    if [[ -t 1 ]]; then git checkout "$branch"; else echo $branch; fi
}
