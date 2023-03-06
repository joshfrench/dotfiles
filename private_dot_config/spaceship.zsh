local -A colors
colors[base03]='#002b36'
colors[base02]='#073642'
colors[base01]='#586e75'
colors[base00]='#657b83'
colors[base0]='#839496'
colors[base1]='#93a1a1'
colors[base2]='#eee8d5'
colors[base3]='#fdf6e3'
colors[yellow]='#b58900'
colors[orange]='#cb4b16'
colors[red]='#dc322f'
colors[magenta]='#d33682'
colors[violet]='#6c71c4'
colors[blue]='#268bd2'
colors[cyan]='#2aa198'
colors[green]='#859900'
colors[highlite]='#004b5e'

# SPACESHIP_PROMPT_ORDER=(
#   dir
#   time
#   user
#   host
#   char
# )

SPACESHIP_CHAR_SYMBOL='%%'
SPACESHIP_CHAR_SUFFIX=' '

SPACESHIP_TIME_SHOW=true
SPACESHIP_TIME_COLOR=$colors[base01]

SPACESHIP_DIR_PREFIX=''

SPACESHIP_GIT_SYMBOL='󰘬 '
SPACESHIP_GIT_PREFIX=''
SPACESHIP_GIT_BRANCH_ASYNC=true
SPACESHIP_GIT_BRANCH_COLOR=$colors[base0]
SPACESHIP_GIT_STATUS_PREFIX=' '
SPACESHIP_GIT_STATUS_SUFFIX=' '
SPACESHIP_GIT_STATUS_STASHED=''
SPACESHIP_GIT_STATUS_UNTRACKED="%F{red}●%f"
SPACESHIP_GIT_STATUS_MODIFIED="%F{yellow}●%f"
SPACESHIP_GIT_STATUS_ADDED="%F{green}●%f"
