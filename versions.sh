#!/usr/bin/env bash
set -Eeuo pipefail

if [ -z "${TIANON_DOCKERFILES:-}" ] && [ -x ~/docker/dockerfiles/.libs/git.sh ]; then
	TIANON_DOCKERFILES=~/docker/dockerfiles
fi
[ -d "$TIANON_DOCKERFILES" ]
source "$TIANON_DOCKERFILES/.libs/git.sh"

versions=( "$@" )
if [ ${#versions[@]} -eq 0 ]; then
	versions=( */ )
	json='{}'
else
	json="$(< versions.json)"
fi
versions=( "${versions[@]%/}" )

hook_version() {
	local rcVersion="${folder%-rc}"
	case "$3" in
		"$rcVersion" | "$rcVersion"[.-]*)
			return 0
			;;
	esac
	return 1
}
versions_hooks+=( hook_version )

hook_rc-status() {
	local rc=1 ga=0
	if [[ "$folder" == *-rc ]]; then
		rc=0 ga=1
	fi
	if ! hook_no-prereleases "$@"; then
		return "$rc"
	fi
	return "$ga"
}
versions_hooks+=( hook_rc-status )

hook_sha256() {
	local version="$3"
	local sha256 urlBase="https://github.com/syncthing/syncthing/releases/download/v$version"
	sha256="$(wget -qO- "$urlBase/sha256sum.txt.asc")" || return 1
	local json
	json="$(jq <<<"$sha256" -csR --arg urlBase "$urlBase" -L"$TIANON_DOCKERFILES/.libs" '
		include "lib"
		;
		split("\n")
		| map(
			capture("^(?<sha256>[0-9a-f]{64}) [ *](?<file>syncthing-(?<goos>[^.-]+)-(?<goarch>[^.-]+)-v[0-9.-]+[.].*)$")
			| select(.goos == "macos" and .goarch == "universal" | not)
			| .goos |= ({
				"macos": "darwin",
			}[.] // .)
			| .arch = ({
				"386": "i386",
				"arm": ("arm32v5", "arm32v6", "arm32v7"), # https://github.com/syncthing/syncthing/blob/541572781b1b089ad7fb5cac124858166410d5c7/.github/workflows/build-syncthing.yaml#L19 (GOARM: "5")
				"arm64": "arm64v8",
			}[.goarch] // .goarch)
			| if .goos == "linux" then . else
				.arch = .goos + "-" + .arch
			end
			| { (.arch): {
				url: ($urlBase + "/" + .file),
				sha256: .sha256,
				apkArch: (.arch | apk_arch),
			} }
		)
		| { arches: add }
	')" || return 1
	jq <<<"$json" -e '.arches | has("amd64") and has("arm64v8")' > /dev/null || return 1 # sanity check
	printf '%s\n' "$json"
}
versions_hooks+=( hook_sha256 )

for folder in "${versions[@]}"; do
	export folder

	echo "finding $folder ..."
	doc="$(git-tags 'https://github.com/syncthing/syncthing.git')"

	json="$(jq <<<"$json" -c --argjson doc "$doc" '.[env.folder] = $doc')"
done

jq <<<"$json" 'to_entries | sort_by(.key) | from_entries' > versions.json
