#
# NOTE: THIS DOCKERFILE IS GENERATED VIA "apply-templates.sh"
#
# PLEASE DO NOT EDIT IT DIRECTLY.
#

FROM alpine:3.21

RUN set -eux; \
	addgroup -g 1000 user; \
	adduser -u 1000 -G user -D user

# https://github.com/syncthing/syncthing/releases
ENV SYNCTHING_VERSION 1.29.7-rc.3

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v1.29.7-rc.3/syncthing-linux-386-v1.29.7-rc.3.tar.gz'; sha256='c254d0c0daea48516cf53eff3c1819b0cb200eb48d8593b9c363186fccbf04fb' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v1.29.7-rc.3/syncthing-linux-amd64-v1.29.7-rc.3.tar.gz'; sha256='bd691855ffe9f5d1831f2a8aeadb69fcd9820665bf11b0700e0a056358212680' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v1.29.7-rc.3/syncthing-linux-arm-v1.29.7-rc.3.tar.gz'; sha256='76a3b7f8b5cf597f0e41fd1c50e6a60a610fd11f5c644ce5b52b9082e8f8758e' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v1.29.7-rc.3/syncthing-linux-arm-v1.29.7-rc.3.tar.gz'; sha256='76a3b7f8b5cf597f0e41fd1c50e6a60a610fd11f5c644ce5b52b9082e8f8758e' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v1.29.7-rc.3/syncthing-linux-arm64-v1.29.7-rc.3.tar.gz'; sha256='ad1272e253f05969bd18e3bab422f88bec1d1f668d541a015273bfd0c9c6bb58' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v1.29.7-rc.3/syncthing-linux-ppc64le-v1.29.7-rc.3.tar.gz'; sha256='d8e8bc6f0281550e6ae0b731ae9cb58b17ae2a42a06fd6d32615e317073ce47b' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v1.29.7-rc.3/syncthing-linux-riscv64-v1.29.7-rc.3.tar.gz'; sha256='f77c14222333081c9bd5c86d9bf6221c3240737d29d5b9220586e3c6b39fdbc2' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v1.29.7-rc.3/syncthing-linux-s390x-v1.29.7-rc.3.tar.gz'; sha256='4fd2a702d317fbd5b812335e09ef834e33064a3a69a2090a4f97849e74fb6705' ;; \
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
