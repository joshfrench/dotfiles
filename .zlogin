setopt prompt_subst

autoload -Uz add-zsh-hook
autoload -Uz vcs-info

prompt_medium_aws_profile() {
  [[ -n ${AWS_PROFILE} ]] && print -n " %F{yellow}☁︎ ${AWS_PROFILE:t}%f "
}


+vi-git-untracked() {
  if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
     git status --porcelain | grep -m 1 '^??' &>/dev/null
  then
    hook_com[misc]='%F{red}●'
  fi
}

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
zstyle ':vcs_info:git*' actionformats '%F{cyan}[%r@%b %u%c%m] (%a)%f'
zstyle ':vcs_info:git*' formats '%F{cyan}[%r@%b %u%c%m%f%F{cyan}]%f'
zstyle ':vcs_info:*' unstagedstr '%F{yellow}●'
zstyle ':vcs_info:*' stagedstr '%F{green}●'

add-zsh-hook precmd prompt_medium_aws_profile
add-zsh-hook precmd vcs_info

RPROMPT='$(prompt_medium_aws_profile)%F{blue}%(5~<%-1~/.../%2~<%~)%f'
PROMPT='${vcs_info_msg_0_}%(?.%F{green}.%F{red})%#%f '
SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '

export LSCOLORS="exgxBxdxcxegaxabagacad"
export LS_COLORS='di=34;40:ln=36;40:so=1;;40:pi=33;40:ex=32;40:bd=34;46:cd=0;40:su=0;41:sg=0;46:tw=0;42:ow=0;43:'
