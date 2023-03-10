local -A colors=(
  base03 '#002b36'
  base02 '#073642'
  base01 '#586e75'
  base00 '#657b83'
  base0 '#839496'
  base1 '#93a1a1'
  base2 '#eee8d5'
  base3 '#fdf6e3'
  yellow '#b58900'
  orange '#cb4b16'
  red '#dc322f'
  magenta '#d33682'
  violet '#6c71c4'
  blue '#268bd2'
  cyan '#2aa198'
  green '#859900'
  highlite '#004b5e'
)

# SPACESHIP_PROMPT_ORDER=(
#   dir
#   time
#   user
#   host
#   char
# )

spaceship remove aws
spaceship remove kubectl
spaceship remove venv
spaceship add venv --before git
spaceship remove time
spaceship add time --before dir

SPACESHIP_RPROMPT_ORDER=(
  aws
  kubectl
)

SPACESHIP_CHAR_SYMBOL='%%'
SPACESHIP_CHAR_SUFFIX=' '
SPACESHIP_PROMPT_DEFAULT_PREFIX='' # no `via`
SPACESHIP_ASYNC_SHOW=false # no ... while loading

SPACESHIP_TIME_SHOW=true
SPACESHIP_TIME_COLOR=$colors[base01]
SPACESHIP_TIME_PREFIX=''

SPACESHIP_EXEC_TIME_PREFIX=''

SPACESHIP_DIR_PREFIX=''

SPACESHIP_GIT_SYMBOL='󰘬 '
SPACESHIP_GIT_PREFIX=''
SPACESHIP_GIT_STATUS_COLOR=$colors[base0]
SPACESHIP_GIT_BRANCH_ASYNC=true
SPACESHIP_GIT_BRANCH_COLOR=$colors[base0]
SPACESHIP_GIT_BRANCH_SUFFIX=''
SPACESHIP_GIT_STATUS_PREFIX=' '
SPACESHIP_GIT_STATUS_SUFFIX=''
SPACESHIP_GIT_STATUS_STASHED=''
SPACESHIP_GIT_STATUS_UNTRACKED="%F{red}●%f"
SPACESHIP_GIT_STATUS_MODIFIED="%F{yellow}●%f"
SPACESHIP_GIT_STATUS_ADDED="%F{green}●%f"
SPACESHIP_GIT_STATUS_AHEAD='󱦲'
SPACESHIP_GIT_STATUS_BEHIND='󱦳'

SPACESHIP_DOCKER_SHOW=false

SPACESHIP_PYTHON_SHOW=false
SPACESHIP_VENV_COLOR=$colors[green]
SPACESHIP_VENV_SYMBOL=' '

SPACESHIP_KUBECTL_SHOW=true
SPACESHIP_KUBECTL_SYMBOL=''
SPACESHIP_KUBECTL_PREFIX=''
SPACESHIP_KUBECTL_VERSION_SHOW=false
SPACESHIP_KUBECTL_CONTEXT_COLOR=$colors[blue]
SPACESHIP_KUBECTL_CONTEXT_COLOR_GROUPS=(
  $colors[violet] '^lucid-staging-*'
  $colors[red] '^lucid-production-*'
)

SPACESHIP_AWS_COLOR=$colors[yellow]
SPACESHIP_AWS_SYMBOL='󰅣 '

SPACESHIP_NODE_SHOW=false

SPACESHIP_GOLANG_SHOW=false

typeset -gx PYENV_VIRTUALENV_DISABLE_PROMPT=1
