credstash_get() {
  local creds
  [ "$#" -eq "0" ] && echo "Usage: credstash_get KEY KEY2 KEY3..." && return
  if [ -z "${CREDSTASH_LOADED}" ]; then
    echo "getting credentials from credstash..."
    creds=$(pipenv run credstash getall)
    [ -z "${creds}" ] && return
    for v in "$@"; do
      export ${v}=$(jq -r .${v} <<< ${creds})
    done
    export CREDSTASH_LOADED=yes
  fi
}
