function custom_git_prompt () {
  ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
  repo=$(command git rev-parse --show-toplevel 2> /dev/null) || return
  echo "$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX$(basename $repo)@${ref#refs/heads/}$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

MODE_INDICATOR="%{$fg[blue]%}[vi]%{$reset_color%}"
PROMPT='$(custom_git_prompt)%(?,%{$fg[green]%},%{$fg[red]%})%#%{$reset_color%} '
RPROMPT='%{$fg_bold[blue]%}%(5~<%-1~/../%2~<%~)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_CLEAN=''
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}!%{$reset_color%}" 
