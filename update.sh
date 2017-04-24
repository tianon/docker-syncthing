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

	IFS=$'\n'; fullVersions=( $(echo "$tags" | grep "^v$rcVersion[.]" | grep $rcGrepV -E -- '-alpha|-beta|-rc') ); unset IFS
	case "$version" in
		0.10|0.11|0.12|0.13) fullVersion="${fullVersions[0]}" ;;
		*)
			fullVersion=
			for possible in "${fullVersions[@]}"; do
				# make sure the version we include actually has release artifacts
				tarball="https://github.com/syncthing/syncthing/releases/download/${possible}/sha256sum.txt.asc"
				# "wget --spider" on a github release artifact doesn't work properly (sometimes?), so we just download the full sha256sum file instead
				#tarball="https://github.com/syncthing/syncthing/releases/download/${possible}/syncthing-linux-amd64-${possible}.tar.gz"
				if wget --quiet -O /dev/null "$tarball" &> /dev/null; then
					fullVersion="$possible"
					break
				fi
				echo >&2 "warning: $possible appears to be missing release artifacts; ignoring"
			done
			;;
	esac
	if [ -z "$fullVersion" ]; then
		echo >&2 "warning: cannot find full version for $version"
		continue
	fi
	fullVersion="${fullVersion#v}"
	( set -x; sed -ri 's/^(ENV SYNCTHING_VERSION) .*/\1 '"$fullVersion"'/' "$version/Dockerfile" )
done
