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
ENV SYNCTHING_VERSION 1.27.12

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v1.27.12/syncthing-linux-386-v1.27.12.tar.gz'; sha256='3baf10d034c7b435b0bbab1e4045ee073a8bdfdc587a18815f63644bc7660e55' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.12/syncthing-linux-amd64-v1.27.12.tar.gz'; sha256='dca95942e9b2980f01e3d8e41575cd6b3ebfae87b09110d05c9257f038bb9de6' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v1.27.12/syncthing-linux-arm-v1.27.12.tar.gz'; sha256='fc315171253e1582c3cc64cae9fd550fa4a0d6db286819244f73b3fdced7bdcb' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v1.27.12/syncthing-linux-arm-v1.27.12.tar.gz'; sha256='fc315171253e1582c3cc64cae9fd550fa4a0d6db286819244f73b3fdced7bdcb' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.12/syncthing-linux-arm64-v1.27.12.tar.gz'; sha256='ec83a3d2acb4da7fce4c017bf7ed4d7f5b10deb134286fb8f70b07dd2617f2ad' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v1.27.12/syncthing-linux-ppc64le-v1.27.12.tar.gz'; sha256='8aede8eaf56c3e02fd88bb83cb6bb0463bc5fbe66ce5759dea39bfcce62f5d88' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.12/syncthing-linux-riscv64-v1.27.12.tar.gz'; sha256='419601b4de3660396b9048f9f55b518474472bb382c661629bc8a1903806122b' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v1.27.12/syncthing-linux-s390x-v1.27.12.tar.gz'; sha256='7c78966b49d7f9d29793675249d63de4f87dc1c022ba3b65e853a401aef7dc9b' ;; \
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
