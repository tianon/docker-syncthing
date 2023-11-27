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
ENV SYNCTHING_VERSION 1.27.0-rc.2

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v1.27.0-rc.2/syncthing-linux-386-v1.27.0-rc.2.tar.gz'; sha256='1154101ad95a1c5201d374b02953ee1c54a3c9e788f9c466ca2b9f072d0daf94' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.0-rc.2/syncthing-linux-amd64-v1.27.0-rc.2.tar.gz'; sha256='a895adde83829b77ef7d78a1037f33467941dd85509a09495deae82a156e39ec' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v1.27.0-rc.2/syncthing-linux-arm-v1.27.0-rc.2.tar.gz'; sha256='e9e3484335216dbae99d44ec0948f2d42713e74cb3de8379a1a562b3c3aa19cb' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v1.27.0-rc.2/syncthing-linux-arm-v1.27.0-rc.2.tar.gz'; sha256='e9e3484335216dbae99d44ec0948f2d42713e74cb3de8379a1a562b3c3aa19cb' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.0-rc.2/syncthing-linux-arm64-v1.27.0-rc.2.tar.gz'; sha256='8c6d543dc890d1a6eb3bca6bb1e1b94c9688081987cabd22f9e2cce956209962' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v1.27.0-rc.2/syncthing-linux-ppc64le-v1.27.0-rc.2.tar.gz'; sha256='ab4d0cafe0a05b8135b5f11f5f213d215a9b6f51949afccc8e66fdf19bd9daaa' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.0-rc.2/syncthing-linux-riscv64-v1.27.0-rc.2.tar.gz'; sha256='a5234e3a8a6c387a7cd7d0d03ace8d5bfa3f96d28ecabb54357c7eaae2315770' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v1.27.0-rc.2/syncthing-linux-s390x-v1.27.0-rc.2.tar.gz'; sha256='7f20c5efbb8f9d358730e30674d1ee69ef55a9d646bbc70c519de2df10a0ceca' ;; \
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
