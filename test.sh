#!/bin/bash

set -euxo pipefail

get_latest_release() {
  URL="https://github.com/$1/$2/releases/latest"

  VERSION=$(curl -is "$URL" \
  | grep location \
  | awk -F '/' '{print $8}')

  echo "${VERSION/$'\r'/}"
}

UPS_VER="$(get_latest_release 'microsoft' 'vscode-java-test')"
REL_VER="$(get_latest_release 'nvim-java' 'vscode-java-test-releases')"

if [ "$UPS_VER" == "$REL_VER" ]; then
    echo "EQUAL"
fi
