#
# NOTE: THIS DOCKERFILE IS GENERATED VIA "apply-templates.sh"
#
# PLEASE DO NOT EDIT IT DIRECTLY.
#

FROM alpine:3.22

RUN set -eux; \
	addgroup -g 1000 user; \
	adduser -u 1000 -G user -D user

# https://github.com/syncthing/syncthing/releases
ENV SYNCTHING_VERSION 2.0.14-rc.1

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v2.0.14-rc.1/syncthing-linux-386-v2.0.14-rc.1.tar.gz'; sha256='7e3615f7b7f73f26fe93d261ffe9b5f4b29ad34b4b119a1610f9670d9ab6ab20' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.14-rc.1/syncthing-linux-amd64-v2.0.14-rc.1.tar.gz'; sha256='042dff4ae9cea5fb83327c11be6474e48d3e2ea6d0468f9e5f2b4393c1413038' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v2.0.14-rc.1/syncthing-linux-arm-v2.0.14-rc.1.tar.gz'; sha256='b2dd5c4d4e09e349906a4c0168eb53b9fe315eef93dff17efb20f3cef1806515' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v2.0.14-rc.1/syncthing-linux-arm-v2.0.14-rc.1.tar.gz'; sha256='b2dd5c4d4e09e349906a4c0168eb53b9fe315eef93dff17efb20f3cef1806515' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.14-rc.1/syncthing-linux-arm64-v2.0.14-rc.1.tar.gz'; sha256='2df0931ca10e201ac95949d4775e3389625e3d1baf5dfa6422c08041f5970601' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v2.0.14-rc.1/syncthing-linux-ppc64le-v2.0.14-rc.1.tar.gz'; sha256='699e05712bc2b68febba4773995bd4e5707dc87e9a362b00c9e27a23fee7bc30' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.14-rc.1/syncthing-linux-riscv64-v2.0.14-rc.1.tar.gz'; sha256='c109d147f75b02b730a3da8c5fade47d6dfdf7308128b832fd3b0f2e655b52fc' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v2.0.14-rc.1/syncthing-linux-s390x-v2.0.14-rc.1.tar.gz'; sha256='fd250ab96b98e3c08e329603a6c3b9aa7d1332770d3cd300a236d0ba6ab2bca7' ;; \
		*) echo >&2 "error: unsupported architecture: '$apkArch'"; exit 1 ;; \
	esac; \
	tarball="$(basename "$url")"; \
	wget -O "$tarball" "$url"; \
	echo "$sha256 *$tarball" | sha256sum -c -; \
	dir="${tarball%.tar.*}"; \
	bin="$dir/syncthing"; \
	tar -xvf "$tarball" "$bin"; \
	rm "$tarball"; \
	mv "$bin" /usr/local/bin/; \
	rmdir "$dir"; \
# smoke test
	syncthing --help

USER user
CMD ["syncthing"]
