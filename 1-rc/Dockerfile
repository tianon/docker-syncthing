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
ENV SYNCTHING_VERSION 1.29.6-rc.3

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v1.29.6-rc.3/syncthing-linux-386-v1.29.6-rc.3.tar.gz'; sha256='0f8d6ffa19870761a3694054b27c1f3c35e3e9e0b846098ae307e19096a0c5c4' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v1.29.6-rc.3/syncthing-linux-amd64-v1.29.6-rc.3.tar.gz'; sha256='7cb80a68d50793e6dd627437024c897301319e27978c48ee5c882835832bbdc0' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v1.29.6-rc.3/syncthing-linux-arm-v1.29.6-rc.3.tar.gz'; sha256='b1eadbca73ee6899e2b302460ea228f2548667c4f9e0da7acfd6768818692e1d' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v1.29.6-rc.3/syncthing-linux-arm-v1.29.6-rc.3.tar.gz'; sha256='b1eadbca73ee6899e2b302460ea228f2548667c4f9e0da7acfd6768818692e1d' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v1.29.6-rc.3/syncthing-linux-arm64-v1.29.6-rc.3.tar.gz'; sha256='590b4c319f09f1c07b6c849543ff9f9c18664fde46291860724f1c8d56fdff4b' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v1.29.6-rc.3/syncthing-linux-ppc64le-v1.29.6-rc.3.tar.gz'; sha256='39025f63176ccc2c15c44925de825a9ca31ad95f99e255e3bda3fb0947cc1db6' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v1.29.6-rc.3/syncthing-linux-riscv64-v1.29.6-rc.3.tar.gz'; sha256='c788795f5d96bae01cefa4fd730f108cdd68cbe809c9b10ffb918aff19269f47' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v1.29.6-rc.3/syncthing-linux-s390x-v1.29.6-rc.3.tar.gz'; sha256='8df53ddddc1b309e4a01ff47156b874ba906d3fd12ada5d3ed937cc64b9d316e' ;; \
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
