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
ENV SYNCTHING_VERSION 2.0.0-rc.13

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.13/syncthing-linux-386-v2.0.0-rc.13.tar.gz'; sha256='c12fd0809b5ba4d34048e85d9e5c4ebdf4b5bff6b6a1f718401f99ff104d7a18' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.13/syncthing-linux-amd64-v2.0.0-rc.13.tar.gz'; sha256='5cc9364076c339b1aabdc960ce351dd454a658ec155a3b8a333962eae155c7a5' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.13/syncthing-linux-arm-v2.0.0-rc.13.tar.gz'; sha256='570c2e42ae7480f0e4cac2cbe3c97c6ad4bc5a254578977706c1938e2797a906' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.13/syncthing-linux-arm-v2.0.0-rc.13.tar.gz'; sha256='570c2e42ae7480f0e4cac2cbe3c97c6ad4bc5a254578977706c1938e2797a906' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.13/syncthing-linux-arm64-v2.0.0-rc.13.tar.gz'; sha256='6a488346ae66c47dbf4155881665480f18621821be1f1ba8a16c95e6c0fc0c08' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.13/syncthing-linux-ppc64le-v2.0.0-rc.13.tar.gz'; sha256='6a8b0cb8217c5be42fde299031c08329dff4ea67e591d65b55c2cc13da5a03fb' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.13/syncthing-linux-riscv64-v2.0.0-rc.13.tar.gz'; sha256='094c3230fc648c7ad913600e8c6268f4b9a74ca8bef0ba4ab8ab34b3d56cf46d' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.13/syncthing-linux-s390x-v2.0.0-rc.13.tar.gz'; sha256='5b161e35f9ee6773a6edc5adf6b989392b787861b63fdfae64f1a0f94c9a8b9f' ;; \
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
