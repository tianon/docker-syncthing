#!/bin/bash
set -e

declare -A aliases
aliases=(
	[0.12]='0 latest'
)

cd "$(dirname "$(readlink -f "$BASH_SOURCE")")"

versions=( */ )
versions=( "${versions[@]%/}" )
url='git://github.com/tianon/docker-syncthing'

echo '# maintainer: Tianon Gravi <admwiggin@gmail.com> (@tianon)'

for (( i = ${#versions[@]} - 1; i >= 0; --i )); do
	version="${versions[$i]}"

	commit="$(cd "$version" && git log -1 --format='format:%H' -- Dockerfile $(awk 'toupper($1) == "COPY" { for (i = 2; i < NF; i++) { print $i } }' Dockerfile))"
	fullVersion="$(grep -m1 'ENV SYNCTHING_VERSION ' "$version/Dockerfile" | cut -d' ' -f3)"
	versionAliases=( $fullVersion $version ${aliases[$version]} )

	echo
	for va in "${versionAliases[@]}"; do
		echo "$va: ${url}@${commit} $version"
	done
done
