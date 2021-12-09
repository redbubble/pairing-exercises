#!/bin/bash
# Fail on any error by default
set -e

readonly WORKSPACE=$(pwd)

COMMAND="default"
if [[ "$#" -ge 1 ]]; then
    COMMAND=$1
fi

cat << EOF
-----------------------------------------------------
 * workspace: ${WORKSPACE}
 * command: ${COMMAND}
-----------------------------------------------------
EOF

# dependencies
go get golang.org/x/tools/cmd/goimports
go get golang.org/x/tools/cmd/cover

imports() {
  goimports -w .
}

install() {
  echo "Building components..."
  GOBIN=${WORKSPACE}/bin go install -race ./...
}

test() {
  echo "Running tests..."
  go test -v -coverpkg=./... -coverprofile=cover.out ./...
}

calculate() {
  ./bin/calculate -cartFile="$1" -pricesFile="$2"
}

coverage() {
  go tool cover -html=cover.out
}

lint() {
  golangci-lint run --enable-all
}

case ${COMMAND}  in
    imports)
        imports
        ;;
    install)
        install
        ;;
    test)
        test
        ;;
    calculate)
      install
      calculate "$2" "$3"
      ;;
    coverage)
      test
      coverage
      ;;
    lint)
      lint
      ;;
    *)
        install
cat << EOF

 * Usage: ./build.sh <command>
  * command: build (default = install)
   - calculate:    calculates cart cost
   - coverage:      coverage report
   - imports:      fix / cleanup go import statements
   - install:      builds binaries
   - lint:         lint all the things
   - test:         runs tests



EOF
        ;;
esac
