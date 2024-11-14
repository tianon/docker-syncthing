#
# NOTE: THIS DOCKERFILE IS GENERATED VIA "apply-templates.sh"
#
# PLEASE DO NOT EDIT IT DIRECTLY.
#

FROM alpine:3.18

RUN set -eux; \
	addgroup -g 1000 user; \
	adduser -u 1000 -G user -D user

# https://github.com/syncthing/syncthing/releases
ENV SYNCTHING_VERSION 1.28.1-rc.1

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v1.28.1-rc.1/syncthing-linux-386-v1.28.1-rc.1.tar.gz'; sha256='3e057a136c0db30f18788a6e0b1fc36d933ff75e7b858f2b9d5d4d800f62d9be' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v1.28.1-rc.1/syncthing-linux-amd64-v1.28.1-rc.1.tar.gz'; sha256='81bbab5ebe8001d18204b927ac59598797c09a36138d3cea7e062376b96e967f' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v1.28.1-rc.1/syncthing-linux-arm-v1.28.1-rc.1.tar.gz'; sha256='7403024200460974938321f9664bc0fab1a717b3284e7b32979d3af86e5014ef' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v1.28.1-rc.1/syncthing-linux-arm-v1.28.1-rc.1.tar.gz'; sha256='7403024200460974938321f9664bc0fab1a717b3284e7b32979d3af86e5014ef' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v1.28.1-rc.1/syncthing-linux-arm64-v1.28.1-rc.1.tar.gz'; sha256='e29d93b83f1b2fed2a49045decac28c46a4f9a974c2ed425f82562cd939790b7' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v1.28.1-rc.1/syncthing-linux-ppc64le-v1.28.1-rc.1.tar.gz'; sha256='7fc60200d51de7ff37e63299dc3ad84220ac651abb6fc28eee4ea90b5263fb6b' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v1.28.1-rc.1/syncthing-linux-riscv64-v1.28.1-rc.1.tar.gz'; sha256='8e22fa7154faba780ade98c1f2d760ad5d1a387537e642b20c5527bccebe9e60' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v1.28.1-rc.1/syncthing-linux-s390x-v1.28.1-rc.1.tar.gz'; sha256='cec7f13d452e13fa12c36f890d70f012791e039e81ab96d011f553e87244db2d' ;; \
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
