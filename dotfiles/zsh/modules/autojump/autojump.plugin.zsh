j() {
  unset -f j
 [ -f $HOMEBREW_PREFIX/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh
 j "$@"
}
