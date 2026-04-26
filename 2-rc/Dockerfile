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
ENV SYNCTHING_VERSION 2.1.0-rc.1

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v2.1.0-rc.1/syncthing-linux-386-v2.1.0-rc.1.tar.gz'; sha256='c258e3a170d4258604fddcf46a6872b863d01758bba6ba2d4b5ba85b5c4aaae9' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v2.1.0-rc.1/syncthing-linux-amd64-v2.1.0-rc.1.tar.gz'; sha256='7d578381b3b2589836e5aad64d7b7a0d2b76d507a8cc1d96b28445e4844db068' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v2.1.0-rc.1/syncthing-linux-arm-v2.1.0-rc.1.tar.gz'; sha256='4eb72f8790173de25644d965c5a612a97921744b4d96f36784d0d01c5428bdc4' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v2.1.0-rc.1/syncthing-linux-arm-v2.1.0-rc.1.tar.gz'; sha256='4eb72f8790173de25644d965c5a612a97921744b4d96f36784d0d01c5428bdc4' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v2.1.0-rc.1/syncthing-linux-arm64-v2.1.0-rc.1.tar.gz'; sha256='2a1940335dc072958be14e193a6c8a5db7d27caf7fd9099472ff75a5ff000041' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v2.1.0-rc.1/syncthing-linux-ppc64le-v2.1.0-rc.1.tar.gz'; sha256='32c4663290ba7e1feb35fac3fa44699c576c80220369db687404152c50165c00' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v2.1.0-rc.1/syncthing-linux-riscv64-v2.1.0-rc.1.tar.gz'; sha256='574fb6303c80699084235202dfd0ec94eebf715c9eaf2d8d60b74366337a1647' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v2.1.0-rc.1/syncthing-linux-s390x-v2.1.0-rc.1.tar.gz'; sha256='67a4bf099b08ef1b3360f8872a0fc68061135371fd1d3d56b4def64a9596397b' ;; \
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
