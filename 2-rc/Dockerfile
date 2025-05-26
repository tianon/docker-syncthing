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
ENV SYNCTHING_VERSION 2.0.0-rc.17

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.17/syncthing-linux-386-v2.0.0-rc.17.tar.gz'; sha256='1b7efe62669e1d0b64470ae82f1475967c60ba44dc7eb4294bcb81f4910938f1' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.17/syncthing-linux-amd64-v2.0.0-rc.17.tar.gz'; sha256='9193cb90b9ecd322c73e4a415bc8ca7239707346ab489a2c2d9900cc6a4d1f81' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.17/syncthing-linux-arm-v2.0.0-rc.17.tar.gz'; sha256='0417ffca22f42ba4bc96a9a6276b65da28cf7af6c449ced30c2a459259f78697' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.17/syncthing-linux-arm-v2.0.0-rc.17.tar.gz'; sha256='0417ffca22f42ba4bc96a9a6276b65da28cf7af6c449ced30c2a459259f78697' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.17/syncthing-linux-arm64-v2.0.0-rc.17.tar.gz'; sha256='4dd7366cee9b85e36a1f9dd9e40134cc5a3c4d1e3e2a6bddb1894b045e09d501' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.17/syncthing-linux-ppc64le-v2.0.0-rc.17.tar.gz'; sha256='11332bede6c630dec7bb917527689c89e0b49401dca902e6dbd0b53d6beb3de8' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.17/syncthing-linux-riscv64-v2.0.0-rc.17.tar.gz'; sha256='9a3366520751b37ec241071ebeebaffb9a76cf7359515ed1ca4c0f101196b20d' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.17/syncthing-linux-s390x-v2.0.0-rc.17.tar.gz'; sha256='d38ee660ff5850fc261218c949220e05d524a40fb45ee8fef737eb65997479a6' ;; \
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
