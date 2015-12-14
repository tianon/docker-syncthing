#!/bin/bash
set -e

cd "$(dirname "$(readlink -f "$BASH_SOURCE")")"

./generate-stackbrew-library.sh > syncthing
bashbrew push --namespaces=tianon ./syncthing
rm syncthing
