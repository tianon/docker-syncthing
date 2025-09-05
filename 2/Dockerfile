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
ENV SYNCTHING_VERSION 2.0.7

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v2.0.7/syncthing-linux-386-v2.0.7.tar.gz'; sha256='8d5fbd1dc06fdcf93ba28e7ab24901e065a3c8aeb0f4421615cf9022dd3ad179' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.7/syncthing-linux-amd64-v2.0.7.tar.gz'; sha256='febea947c0a07f5d225ff0a0ef956443a473b7e8f2c77fbb22d712db83e78eb3' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v2.0.7/syncthing-linux-arm-v2.0.7.tar.gz'; sha256='a9edd369a21f847a0d8f5b0e909056df230de45a3dbae8c928e990e314705265' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v2.0.7/syncthing-linux-arm-v2.0.7.tar.gz'; sha256='a9edd369a21f847a0d8f5b0e909056df230de45a3dbae8c928e990e314705265' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.7/syncthing-linux-arm64-v2.0.7.tar.gz'; sha256='8e1d2e6f72edfbef504672a134759a6ebbd3a8f1c798f55e88e6d61a92f0d8bd' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v2.0.7/syncthing-linux-ppc64le-v2.0.7.tar.gz'; sha256='17362f8d160416a7c8c9b716706726ef1bcb66ed070ce58f6f11231d8415de73' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.7/syncthing-linux-riscv64-v2.0.7.tar.gz'; sha256='99577a7151da7a2e84255bbb2e812fad70f20256122e0388fae8b3a7edc6550b' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v2.0.7/syncthing-linux-s390x-v2.0.7.tar.gz'; sha256='9ca9314c9d9abc3e5340425a4619eaaf64a9782d972b94174f159693c20087be' ;; \
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
