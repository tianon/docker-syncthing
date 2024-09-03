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
ENV SYNCTHING_VERSION 1.27.11

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v1.27.11/syncthing-linux-386-v1.27.11.tar.gz'; sha256='434587703b37f746434fe3617d9e1f4c85069bf8eb78a20f14f91e7db220a982' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.11/syncthing-linux-amd64-v1.27.11.tar.gz'; sha256='7156f1218d894b6ee87873cd68067b36e09fabee66cd8643d12ce9ea7c35a58b' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v1.27.11/syncthing-linux-arm-v1.27.11.tar.gz'; sha256='e97451c28f75b383cb1d8ef39d117909d1f71289fb8c849723fa3f09165495e2' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v1.27.11/syncthing-linux-arm-v1.27.11.tar.gz'; sha256='e97451c28f75b383cb1d8ef39d117909d1f71289fb8c849723fa3f09165495e2' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.11/syncthing-linux-arm64-v1.27.11.tar.gz'; sha256='8389069e8a292b7d8a7a672c71ef7fe28f45c72f81bec3a75d01a2d4ace9bac6' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v1.27.11/syncthing-linux-ppc64le-v1.27.11.tar.gz'; sha256='8007fdc12d1c42a25f660ba211bc3a9e0b740d8d0a83826a920528007800804c' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.11/syncthing-linux-riscv64-v1.27.11.tar.gz'; sha256='4a5793d9b695fa921f1e86e6ba0219be96a2b6809b5fcaba4b83f3b5a3b4c5ed' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v1.27.11/syncthing-linux-s390x-v1.27.11.tar.gz'; sha256='5c6971aae1c453a109c59efe8225dd4a14a32e281d209db45f6d728486c6c1c0' ;; \
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
