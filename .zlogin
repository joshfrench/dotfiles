setopt prompt_subst

autoload -Uz add-zsh-hook
autoload -Uz vcs-info

prompt_medium_aws_profile() {
  [[ -n ${AWS_PROFILE} ]] && print -n " %F{yellow}☁︎ ${AWS_PROFILE:t}%f "
}


+vi-git-untracked() {
  if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
    output=$(git status --porcelain) && \
    [ ! -z $output ]
  then
    if [[ $(grep "^??" <<< $output) ]]
    then
     hook_com[unstaged]+='%F{red}●'
    fi
    hook_com[unstaged]+=' '
  fi

  # echo hook_com[unstaged]
  # hook_com[unstaged] && hook_com[unstaged]+=' '
}

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
zstyle ':vcs_info:git*' formats "%F{cyan}%r%f%F{white}@%f%F{blue}%b %c%u"
zstyle ':vcs_info:*' unstagedstr '%F{yellow}●'
zstyle ':vcs_info:*' stagedstr '%F{green}●'

add-zsh-hook precmd prompt_medium_aws_profile
add-zsh-hook precmd vcs_info

RPROMPT='$(prompt_medium_aws_profile)%F{blue}%(5~<%-1~/.../%2~<%~)%f'
PROMPT='${vcs_info_msg_0_}%(?.%F{green}.%F{red})%_%#%f '
SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [y/n/a/e]? '

export LSCOLORS="exgxBxdxcxegaxabagacad"
export LS_COLORS='di=34;40:ln=36;40:so=1;;40:pi=33;40:ex=32;40:bd=34;46:cd=0;40:su=0;41:sg=0;46:tw=0;42:ow=0;43:'

_gen_fzf_default_opts() {
  local color00='#002b36'
  local color01='#073642'
  local color02='#586e75'
  local color03='#657b83'
  local color04='#839496'
  local color05='#93a1a1'
  local color06='#eee8d5'
  local color07='#fdf6e3'
  local color08='#dc322f'
  local color09='#cb4b16'
  local color0A='#b58900'
  local color0B='#859900'
  local color0C='#2aa198'
  local color0D='#268bd2'
  local color0E='#6c71c4'
  local color0F='#d33682'

  export FZF_DEFAULT_OPTS="
    --color=bg+:$color01,bg:$color00,spinner:$color0B,hl:$color0D
    --color=fg:$color04,header:$color0D,info:$color0A,pointer:$color0C
    --color=marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color0D
    --color=gutter:$color00
  "
}

_gen_fzf_default_opts
