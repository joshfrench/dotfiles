j() {
  unset -f j
 [ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
 j "$@"
}
