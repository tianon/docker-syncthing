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
ENV SYNCTHING_VERSION 2.1.1

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v2.1.1/syncthing-linux-386-v2.1.1.tar.gz'; sha256='e672fd88fa6446be37221b3270dfeb4753e320de5ca8ac39bd2465fa26c5d7db' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v2.1.1/syncthing-linux-amd64-v2.1.1.tar.gz'; sha256='0b960a67a0391156c2ca45943ed1ceaad9ae1fc3772d967e6aafc5a7c662565d' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v2.1.1/syncthing-linux-arm-v2.1.1.tar.gz'; sha256='cd214a87c008940ea0e01a0620345bb04045872c8d844ab45477d51f03451354' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v2.1.1/syncthing-linux-arm-v2.1.1.tar.gz'; sha256='cd214a87c008940ea0e01a0620345bb04045872c8d844ab45477d51f03451354' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v2.1.1/syncthing-linux-arm64-v2.1.1.tar.gz'; sha256='2c831e27c73a5c9217bdbbfcdb695d41b027f9d8bf8303f55590881e7b907f7f' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v2.1.1/syncthing-linux-ppc64le-v2.1.1.tar.gz'; sha256='1c8b43e97cf54b0822a7c6d831f6909aa7e84dcc70329f5990741a62e600b60f' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v2.1.1/syncthing-linux-riscv64-v2.1.1.tar.gz'; sha256='53ef2a9d6a7099bf5967c43ce364a6819e44726634cf55edf34097765ae56f9d' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v2.1.1/syncthing-linux-s390x-v2.1.1.tar.gz'; sha256='c6e92e98251be84e2f57665e09accde107467aba1941bdb4c287f6d36b35e3d5' ;; \
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
