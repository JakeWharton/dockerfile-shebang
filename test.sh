#!/usr/bin/env bash

# https://stackoverflow.com/a/4774063/132047
SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

clean_containers() {
  docker images --filter label=dockerfile-shebang --format "{{.Repository}}:{{.Tag}}" | while IFS= read -r -d '' image; do
    docker rmi "$image" > /dev/null
  done
  docker system prune -a -f --filter label=dockerfile-shebang > /dev/null
}

success=0
failures=0
for d in "$SCRIPTPATH"/fixtures/*/; do
  echo -n "$(basename "$d")… "

  clean_containers

  diff=$(diff -U 0 "$d""expected.txt" <(cd "$d" && PATH="$SCRIPTPATH":$PATH "$d""test.sh"))

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

clean_containers
