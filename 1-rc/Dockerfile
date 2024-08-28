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
ENV SYNCTHING_VERSION 1.27.11-rc.2

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v1.27.11-rc.2/syncthing-linux-386-v1.27.11-rc.2.tar.gz'; sha256='0ace78c9bd88da882212e953884303c82c4082592cc5bd5e76f56a172120e765' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.11-rc.2/syncthing-linux-amd64-v1.27.11-rc.2.tar.gz'; sha256='2c047b294211d56bcd5a72e8586ce43b0dbe764505a41070e3794a4f092f4b05' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v1.27.11-rc.2/syncthing-linux-arm-v1.27.11-rc.2.tar.gz'; sha256='0b14e6992f4b3dd1e64d26243d102e10b2d5e1ca45d0a0107e2d6c37bc8e9b58' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v1.27.11-rc.2/syncthing-linux-arm-v1.27.11-rc.2.tar.gz'; sha256='0b14e6992f4b3dd1e64d26243d102e10b2d5e1ca45d0a0107e2d6c37bc8e9b58' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.11-rc.2/syncthing-linux-arm64-v1.27.11-rc.2.tar.gz'; sha256='0b2e6a2321c137f926a22f9139d2bdfe9033cbee67d82347a5ee6f509534f50f' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v1.27.11-rc.2/syncthing-linux-ppc64le-v1.27.11-rc.2.tar.gz'; sha256='f27f45ebaed58d2f4c471a51ae37513d52f867adf67d7340e3033a4f51811771' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.11-rc.2/syncthing-linux-riscv64-v1.27.11-rc.2.tar.gz'; sha256='638a6c98e1e90c7f029ca1a9962bb3365abcf231261cc5b0cd1e37f4e9a284aa' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v1.27.11-rc.2/syncthing-linux-s390x-v1.27.11-rc.2.tar.gz'; sha256='35466dd4d735428ffbd62af7ca8d5c93d7231e765f38f706d4a264a1f7a00923' ;; \
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
