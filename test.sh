#!/usr/bin/env bash

# https://stackoverflow.com/a/4774063/132047
SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

success=0
failures=0
for d in "$SCRIPTPATH"/fixtures/*/; do
  echo -n "$(basename "$d")… "

  diff=$(diff -U 0 "$d""expected.txt" <(PATH="$SCRIPTPATH":$PATH "$d""test.dockerfile" $(< "$d""args.txt")))

  if [[ $? == 0 ]]; then
    echo "✅"
    success=$((success + 1))
  else
    echo "🚫"
    echo "$diff"
    echo
    failures=$((failures + 1))
  fi
done

echo
echo "$((success + failures)) tests, $success pass, $failures fail"
if [[ $failures != 0 ]]; then
  exit 1
fi
