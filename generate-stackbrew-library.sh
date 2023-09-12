#!/bin/bash
set -eu

declare -A aliases=(
	[1]='latest'
	[1-rc]='rc'
)

self="$(basename "$BASH_SOURCE")"
cd "$(dirname "$(readlink -f "$BASH_SOURCE")")"

versions=( */ )
versions=( "${versions[@]%/}" )

# get the most recent commit which modified any of "$@"
fileCommit() {
	git log -1 --format='format:%H' HEAD -- "$@"
}

# get the most recent commit which modified "$1/Dockerfile" or any file COPY'd from "$1/Dockerfile"
dirCommit() {
	local dir="$1"; shift
	(
		cd "$dir"
		fileCommit \
			Dockerfile \
			$(git show HEAD:./Dockerfile | awk '
				toupper($1) == "COPY" {
					for (i = 2; i < NF; i++) {
						print $i
					}
				}
			')
	)
}

cat <<-EOH
# this file is generated via https://github.com/tianon/docker-syncthing/blob/$(fileCommit "$self")/$self

Maintainers: Tianon Gravi <admwiggin@gmail.com> (@tianon)
GitRepo: https://github.com/tianon/docker-syncthing.git
EOH

# prints "$2$1$3$1...$N"
join() {
	local sep="$1"; shift
	local out; printf -v out "${sep//%/%%}%s" "$@"
	echo "${out#$sep}"
}

for version in "${versions[@]}"; do
	export version

	commit="$(dirCommit "$version")"

	fullVersion="$(jq -r '.[env.version].version' versions.json)"

	rcVersion="${version%-rc}"

	versionAliases=()
	if [ "$version" = "$rcVersion" ]; then
		while [ "$fullVersion" != "$rcVersion" -a "${fullVersion%[.-]*}" != "$fullVersion" ]; do
			versionAliases+=( $fullVersion )
			fullVersion="${fullVersion%[.-]*}"
		done
	else
		versionAliases+=( $fullVersion )
	fi
	versionAliases+=(
		$version
		${aliases[$version]:-}
	)

	from="$(awk '$1 == "FROM" { print $2; exit }' "$version/Dockerfile")" # TODO multi-stage build??
	fromArches="$(bashbrew remote arches --json "$from" | jq -c '.arches | keys')"
	arches="$(jq -r --argjson fromArches "$fromArches" '
		$fromArches - ($fromArches - (.[env.version].arches | keys))
		| join(", ")
	' versions.json)"
	[ -n "$arches" ]

	echo
	cat <<-EOE
		Tags: $(join ', ' "${versionAliases[@]}")
		GitCommit: $commit
		Directory: $version
		Architectures: $arches
	EOE
done
