#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "Usage: pass hash <pass-name>" >&2
  exit 1
fi

file="$1"

content="$(pass show "$file" |
  sed -n '1p' |
  tr -d '\r\n')" || exit 1

[[ -z "$content" ]] && {
  echo "empty password: $file" >&2
  exit 1
}

hash="$(printf '%s' "$content" |
  sha1sum |
  cut -d' ' -f1 |
  tr '[:lower:]' '[:upper:]')" || exit 1

printf '%-40s %s\n' "$hash" "$file"
