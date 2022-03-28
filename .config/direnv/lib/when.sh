# usage: when "$MY_ENV_VAR" echo 'foo...'
# proper quoting matters!

when() {
 if [ ! -z "$1" ]; then
   shift
   "$@"
 fi
}

whennot() {
  if [ -z "$1" ]; then
    shift
    "$@"
  fi
}
