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
ENV SYNCTHING_VERSION 1.27.5-rc.2

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v1.27.5-rc.2/syncthing-linux-386-v1.27.5-rc.2.tar.gz'; sha256='2e5b9809b55e9a013decb2b576cf0f84d9d8079a0966f1a22ca8580e1b24067c' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.5-rc.2/syncthing-linux-amd64-v1.27.5-rc.2.tar.gz'; sha256='c3faf5be02c71444307666210a20a13a4751ed2593214150598ce2066e84e1be' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v1.27.5-rc.2/syncthing-linux-arm-v1.27.5-rc.2.tar.gz'; sha256='721de6a9469ef8dd73514900e2d0826dc7d4c914f65cda07408e0729204196fb' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v1.27.5-rc.2/syncthing-linux-arm-v1.27.5-rc.2.tar.gz'; sha256='721de6a9469ef8dd73514900e2d0826dc7d4c914f65cda07408e0729204196fb' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.5-rc.2/syncthing-linux-arm64-v1.27.5-rc.2.tar.gz'; sha256='4b584a6fa9da2cd3500dd5cabfcd1e365f6f44823acce6410fd038d77f03cdf4' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v1.27.5-rc.2/syncthing-linux-ppc64le-v1.27.5-rc.2.tar.gz'; sha256='95d2bc971c278e5619d643f7786e3a4c13ef8e0b6cdeede7b6d2c71b2104cdfa' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.5-rc.2/syncthing-linux-riscv64-v1.27.5-rc.2.tar.gz'; sha256='a38da2811bd7339737f05c109f6e74e69bbfeb98467e7d0073d0f3e75e10992a' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v1.27.5-rc.2/syncthing-linux-s390x-v1.27.5-rc.2.tar.gz'; sha256='2e35e4314f6f21a9cca754068b87c43660818e583e5d52d0a1984bfe1e6f7d80' ;; \
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
