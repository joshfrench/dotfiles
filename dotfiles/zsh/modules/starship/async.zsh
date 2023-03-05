# %s The VCS in use (git, hg, svn, etc.).
# %b Information about the current branch.
# %a An identifier that describes the action. Only makes sense in actionformats.
# %i The current revision number or identifier. For hg the hgrevformat style may be used to customize the output.
# %c The string from the stagedstr style if there are staged changes in the repository.
# %u The string from the unstagedstr style if there are unstaged changes in the repository.
# %R The base directory of the repository.
# %r The repository name. If %R is /foo/bar/repoXY, %r is repoXY.
# %S A subdirectory within a repository. If $PWD is /foo/bar/repoXY/beer/tasty, %S is beer/tasty.
# %m A "misc" replacement. It is at the discretion of the backend to decide what this replacement expands to.

autoload -Uz add-zsh-hook
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' formats '%b' '%r' '%R' '%a'
zstyle ':vcs_info:git*' actionformats '%b' '%r' '%R' '%a'

_prompt_git_status () {
  local file_status
  typeset -A git_status

  typeset -Ua git_status
	git --no-optional-locks status --porcelain --ignore-submodules -unormal | while IFS='' read -r file_status; do
    if [[ "${file_status:0:2}" == '??' ]]; then
      git_status[3]='%F{red}●%f'
    else
      [[ "${file_status:1:1}" != ' ' ]] && git_status[2]='%F{yellow}●%f'
      [[ "${file_status:0:1}" != ' ' ]] && git_status[1]='%F{green}●%f'
    fi
	done

  print "${(j..)git_status}"
}

_prompt_vcs_info() {
  vcs_info

	local -A info
	info[pwd]=$PWD
	info[branch]=$vcs_info_msg_0_
	info[root]=$vcs_info_msg_1_
	info[top]=$vcs_info_msg_2_
	info[action]=$vcs_info_msg_3_

	print -r - ${(@kvq)info}
}

_prompt_async_callback() {
	local do_render=0
  local job=$1 code=$2 output=$3 exec_time=$4 next_pending=$6

	case $job in
		\[async])
			# Handle all the errors that could indicate a crashed
			# async worker. See zsh-async documentation for the
			# definition of the exit codes.
			if (( code == 2 )) || (( code == 3 )) || (( code == 130 )); then
				# Our worker died unexpectedly, try to recover immediately.
				typeset -g _prompt_async_inited=0
				async_stop_worker "prompt_worker"
				_prompt_async_init   # Reinit the worker.
				_prompt_async_tasks  # Restart all tasks.

				# Reset render state due to restart.
				unset _prompt_async_render_requested
			fi
			;;
		\[async/eval])
			if (( code )); then
				# Looks like async_worker_eval failed,
				# rerun async tasks just in case.
				_prompt_async_tasks
			fi
			;;
    _prompt_git_status)
      local prev_status=$_prompt_git_status
      if [[ -z "$output" ]]; then
        unset _prompt_git_status
      else
        typeset -gx _prompt_git_status=$output
      fi

      [[ $prev_status != $_prompt_git_status ]] && do_render=1
      ;;
    _prompt_vcs_info)
      local -A info
      typeset -gx _prompt_vcs_root
      typeset -gx _prompt_vcs_top
      typeset -gx _prompt_vcs_branch
      typeset -gx _prompt_vcs_action

      info=("${(Q@)${(z)output}}")
      _prompt_vcs_branch=$info[branch]
      _prompt_vcs_root=$info[root]
      _prompt_vcs_top=$info[top]
      _prompt_vcs_action=$info[action]

      do_render=1
      ;;
  esac

  if (( next_pending )); then
		(( do_render )) && typeset -g _prompt_async_render_requested=1
		return
  fi

	if [[ ${_prompt_async_render_requested:-$do_render} = 1 ]]; then
    unset _prompt_async_render_requested
    if [[ $CONTEXT == cont ]]; then
      # When the context is "cont", PS2 is active and calling
      # reset-prompt will have no effect on PS1, but it will
      # reset the execution context (%_) of PS2 which we don't
      # want. Unfortunately, we can't save the output of "%_"
      # either because it is only ever rendered as part of the
      # prompt, expanding in-place won't work.
      return
    fi
    zle reset-prompt
  fi
}

# Try to lower the priority of the worker so that disk heavy operations
# like `git status` has less impact on the system responsivity.
_prompt_async_renice() {
  command renice +15 -p $$
}

_prompt_async_init() {
	typeset -g _prompt_async_inited
	if ((${_prompt_async_inited:-0})); then
		return
	fi
	_prompt_async_inited=1
  async_start_worker "prompt_worker" -u -n
  async_register_callback "prompt_worker" _prompt_async_callback
	async_worker_eval "prompt_worker" _prompt_async_renice
}

_prompt_async_tasks() {
	_prompt_async_init

	# Update the current working directory of the async worker.
	async_worker_eval "prompt_worker" builtin cd -q $PWD

  async_job "prompt_worker" _prompt_git_status
  async_job "prompt_worker" _prompt_vcs_info
}

add-zsh-hook precmd _prompt_async_tasks
