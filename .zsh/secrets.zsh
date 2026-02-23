function secret() {
  local val
  val=$(security find-generic-password -a "$USER" -s "$1" -w 2>/dev/null)
  if [[ -z "$val" ]]; then
    echo "[warn] '$1' is not registered in Keychain" >&2
  fi
  echo "$val"
}

function secret-set() {
  if [[ $# -ne 2 ]]; then
    echo "Usage: secret-set <KEY_NAME> <VALUE>" >&2
    return 1
  fi
  security add-generic-password -a "$USER" -s "$1" -w "$2" -U
  echo "✔ '$1' has been registered in Keychain"
}

function secret-del() {
  security delete-generic-password -a "$USER" -s "$1" >/dev/null 2>&1
  if [[ $? -eq 0 ]]; then
    echo "✔ '$1' has been deleted from Keychain"
  else
    echo "[error] '$1' not found" >&2
    return 1
  fi
}

function secret-list() {
  security dump-keychain | grep "svce" | sed 's/.*="//;s/"//' | sort -u
}
