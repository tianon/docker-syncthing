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
ENV SYNCTHING_VERSION 1.28.0-rc.2

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v1.28.0-rc.2/syncthing-linux-386-v1.28.0-rc.2.tar.gz'; sha256='b5a0f07cd3ca4c18346be69f5c2e105eb70c14b0631c0af909e2490b9d0373fd' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v1.28.0-rc.2/syncthing-linux-amd64-v1.28.0-rc.2.tar.gz'; sha256='e8d2901bf7a0a9ae9858d371ebe4ce712dd373df5eb8d6467b4b3c80d95913d7' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v1.28.0-rc.2/syncthing-linux-arm-v1.28.0-rc.2.tar.gz'; sha256='d61dbd5de2c25d1ac6d0dbdcc43e9ad9c19f564f6dc08ff321500ef00752a7e7' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v1.28.0-rc.2/syncthing-linux-arm-v1.28.0-rc.2.tar.gz'; sha256='d61dbd5de2c25d1ac6d0dbdcc43e9ad9c19f564f6dc08ff321500ef00752a7e7' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v1.28.0-rc.2/syncthing-linux-arm64-v1.28.0-rc.2.tar.gz'; sha256='b42e70df3f7fc8b059163b7d3b5cf02acc4f82d69ceb97bc20d84695fd4ef049' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v1.28.0-rc.2/syncthing-linux-ppc64le-v1.28.0-rc.2.tar.gz'; sha256='a4c7e73c22b76654e8e00041e641df5b4a424a61ca9a33071689f9f2e10eb83b' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v1.28.0-rc.2/syncthing-linux-riscv64-v1.28.0-rc.2.tar.gz'; sha256='a63492c1ceaadfefabb74155a876b990ce5c255693f3669f28c49202523c8c2d' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v1.28.0-rc.2/syncthing-linux-s390x-v1.28.0-rc.2.tar.gz'; sha256='0b7042c608c96d7217e55cacfa1a1af05f61bc178d456e2e52c643ba99c41a86' ;; \
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
