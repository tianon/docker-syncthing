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
ENV SYNCTHING_VERSION 2.0.0-beta.3

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-beta.3/syncthing-linux-386-v2.0.0-beta.3.tar.gz'; sha256='d63412515cb13e083777b58dcb9df76e7235b393e7347664183f4c22e63dbeba' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-beta.3/syncthing-linux-amd64-v2.0.0-beta.3.tar.gz'; sha256='7addde24607ac016fdab1b86bb3ba12005637432bab61417db93f7d60555591b' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-beta.3/syncthing-linux-arm-v2.0.0-beta.3.tar.gz'; sha256='f4cdd6ca4e4bb2e5e92691dfd81d815bc28a4c441ec751dccaedaf70df9c1e75' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-beta.3/syncthing-linux-arm-v2.0.0-beta.3.tar.gz'; sha256='f4cdd6ca4e4bb2e5e92691dfd81d815bc28a4c441ec751dccaedaf70df9c1e75' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-beta.3/syncthing-linux-arm64-v2.0.0-beta.3.tar.gz'; sha256='cc287f6ba3f33b3ad9e355e07ead9957814ae645f1d95803175243089ad1e68d' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-beta.3/syncthing-linux-ppc64le-v2.0.0-beta.3.tar.gz'; sha256='516f6c4eaaff833f535af168c80a8b56abe75ed16b3b2874fb5d4d5ed0d26ab6' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-beta.3/syncthing-linux-riscv64-v2.0.0-beta.3.tar.gz'; sha256='91a0745617bb6393adace8fdec889f4e97af84a581a418af3fb34bdc166d5570' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-beta.3/syncthing-linux-s390x-v2.0.0-beta.3.tar.gz'; sha256='8e7fb71e3e636914b9fcc3ec7de5bad06d3a38e03a8c4e9300cde4198226aab8' ;; \
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
