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
ENV SYNCTHING_VERSION 2.1.1-rc.1

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v2.1.1-rc.1/syncthing-linux-386-v2.1.1-rc.1.tar.gz'; sha256='5f0b2a89a2a74e63a69bcc228784529e60777a761f9de15813ad17d91d202b9a' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v2.1.1-rc.1/syncthing-linux-amd64-v2.1.1-rc.1.tar.gz'; sha256='c5c56be9dec77763612018fe3753dc1bb7659c9feb66fbd6c02cb9fa46ab4656' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v2.1.1-rc.1/syncthing-linux-arm-v2.1.1-rc.1.tar.gz'; sha256='6316e38726cec5575a508a0b6b43d5faba56807fad8370ad699dc263fc203fe9' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v2.1.1-rc.1/syncthing-linux-arm-v2.1.1-rc.1.tar.gz'; sha256='6316e38726cec5575a508a0b6b43d5faba56807fad8370ad699dc263fc203fe9' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v2.1.1-rc.1/syncthing-linux-arm64-v2.1.1-rc.1.tar.gz'; sha256='b6875e0f99cfc799368c3ee8726dd7a2f35257cf345d5eb0164f823e7f52940e' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v2.1.1-rc.1/syncthing-linux-ppc64le-v2.1.1-rc.1.tar.gz'; sha256='33bb53a98cc5f2333fdaae45c60da247778f84736beaad36de19653ceed0212e' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v2.1.1-rc.1/syncthing-linux-riscv64-v2.1.1-rc.1.tar.gz'; sha256='27895ab913616c438b0b428c042038dc037b7d0f6bc9e0c8b18401a37f920a2b' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v2.1.1-rc.1/syncthing-linux-s390x-v2.1.1-rc.1.tar.gz'; sha256='2227d07f4e3df2324659a910f898f147bc8a07b1d8248b2e192f8e3630cd7326' ;; \
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
