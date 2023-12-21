alias ls=exa
alias ll='exa -l'
# alias tmux='env TERM=screen-256color tmux'
alias vim=nvim
alias tf=tfswitch
alias diff=colordiff
alias cat=bat
alias chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'
alias hk='heroku'

kctl() {
  if [[ $1 == '-u' ]]; then
    kubectl config unset current-context
    [[ -v TMUX ]] && tmux set -qgu @tmux_kubecontext_status_config
  else
    kubectl $@
  fi
  [[ -v TMUX ]] && tmux refresh-client -S
}

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

function aws_login() {
  local profile=$1 old login
  aws sts get-caller-identity &> /dev/null
  if [[ $? != 0 ]]; then
    aws sso login --profile $profile
  fi
  export AWS_PROFILE=$profile
  if [[ -v TMUX ]]; then
    tmux set -q @aws-profile $profile
    tmux setenv AWS_PROFILE $profile
    tmux refresh-client -S
  fi
}

# AWS profile
function ap() {
  if [[ $1 == "-u" ]]; then
    unset AWS_PROFILE
    aws sso logout
    if [[ -v TMUX ]]; then
      tmux set -qu @aws-profile
      tmux refresh-client -S
    fi
    return 0
  fi
  local profiles selection profile
  profiles=$(aws configure list-profiles)
  if [[ -n "$1" ]] && [[ "$profiles" =~ (^|[[:space:]])"$1"($|[[:space:]]) ]]; then selection="$1"; else selection=$(echo "$profiles" | fzf --height=10%); fi &&
  if [[ -t 1 ]]; then
    aws_login "$selection"
  else
    echo "$selection"
  fi
}

# Pulumi stack
function stack() {
  local stack profile
  stack=${1:-$(pulumi stack ls -j | jq '.[].name' -r | fzf --height=10%)}
  case $stack in
    lucid-*) profile=hostedapps-poweruser ;;
    vivid-staging*|vivid-production*) profile=${stack}-poweruser ;;
    staging*|production*) profile=vivid-${stack}-poweruser ;;
    *) echo "Stack ${stack} not associated with a profile" && return ;;
  esac
  if [[ -t 1 ]]; then
    pulumi stack select $stack
    aws_login $profile
    echo
  fi
  echo $stack
}
