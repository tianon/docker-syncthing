#!/bin/bash
set -eo pipefail

cd "$(dirname "$(readlink -f "$BASH_SOURCE")")"

versions=( */ )
versions=( "${versions[@]%/}" )

tags="$(git ls-remote --tags https://github.com/syncthing/syncthing.git | grep -v '\^{}$' | cut -d/ -f3 | sort -rV)"

for version in "${versions[@]}"; do
	if [ -x "$version/update.sh" ]; then
		( set -x; "$version/update.sh" )
		continue
	fi

	rcGrepV='-v'
	rcVersion="${version%-rc}"
	if [ "$rcVersion" != "$version" ]; then
		rcGrepV=
	fi
	fullVersion="$(echo "$tags" | grep "^v$rcVersion[.]" | grep $rcGrepV -E -- '-alpha|-beta|-rc' | head -n1)"
	if [ -z "$fullVersion" ]; then
		echo >&2 "warning: cannot find full version for $version"
		continue
	fi
	fullVersion="${fullVersion#v}"
	( set -x; sed -ri 's/^(ENV SYNCTHING_VERSION) .*/\1 '"$fullVersion"'/' "$version/Dockerfile" )
done
