#!/usr/bin/env bash
set -o errexit -o nounset -o pipefail

workspace="$(cd "$(dirname "$0")"; pwd)"

cmd-install() {
  echo >&2 "Building components..."
  GOBIN="${workspace}"/bin go install -race ./...
}

cmd-test() {
  echo >&2 "Running tests..."
  go test -v -coverpkg=./... -coverprofile=cover.out ./...
}

cmd-calculator() {
  cmd-install
  "$workspace"/bin/calculator "$@"
}

cmd-cover() {
  cmd-test
  go tool cover -html=cover.out
}

cmd="${1:-}"
if [[ -z "$cmd" ]]; then
    echo >&2 "Available commands:"
    echo
    typeset -f | grep '^cmd-' | awk '{split($1, a ,"-"); print "-",a[2]}'
    exit 2
fi
"cmd-$cmd" "${@:2}"
