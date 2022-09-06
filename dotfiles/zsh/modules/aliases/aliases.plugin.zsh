alias ls=exa
alias ll='exa -l'
# alias tmux='env TERM=screen-256color tmux'
alias vim=nvim
alias tf=tfswitch
alias diff=colordiff
alias cat=bat
alias chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'
alias koff='kubectl config unset current-context'
alias kctl='kubectl'
alias kctx='kubectx'
alias hk='heroku'

# git branch (interactive)
function gb() {
  if [[ -n "$1" ]]; then git checkout "$1" && return 0; fi
  local branches selection branch
  # branches=$(git branch --sort=-committerdate -vv) &&
  branches=$(git branch --column=plain --sort=committerdate --format='%(HEAD) %(align:width=36)%(refname:short)%(end) %(align:width=14)%(committerdate:relative)%(end) %(contents:subject) %(upstream:track)') &&
     selection=$(echo "$branches" | fzf --tac --height=20%) &&
    branch=$(echo "$selection" | awk '{print $1}' | sed "s/.* //") &&
    if [[ -t 1 ]]; then git checkout "$branch"; else echo $branch; fi
}

# AWS profile
function ap() {
  if [[ $1 == "-u" ]]; then unset AWS_PROFILE && aws sso logout && return 0; fi
  local profiles selection profile
  profiles=$(aws configure list-profiles)
  if [[ -n "$1" ]] && [[ "$profiles" =~ (^|[[:space:]])"$1"($|[[:space:]]) ]]; then selection="$1"; else selection=$(echo "$profiles" | fzf --height=10%); fi &&
  if [[ -t 1 ]]; then export AWS_PROFILE="$selection" && aws sso login; else echo "$selection"; fi
}
