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
ENV SYNCTHING_VERSION 2.0.5

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v2.0.5/syncthing-linux-386-v2.0.5.tar.gz'; sha256='196a66d00dcec1de0b5123a1cceb135c466f215ebb8d3c610cd803a337962a43' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.5/syncthing-linux-amd64-v2.0.5.tar.gz'; sha256='6957a6b983643c54c451d8db0cc1e7fdbf6df18b746a70483cf37c2c6ef3a139' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v2.0.5/syncthing-linux-arm-v2.0.5.tar.gz'; sha256='79a35e7cf4a14cf6eeb1babef9c52b372fd03085f941935c86f55a4a44da7e59' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v2.0.5/syncthing-linux-arm-v2.0.5.tar.gz'; sha256='79a35e7cf4a14cf6eeb1babef9c52b372fd03085f941935c86f55a4a44da7e59' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.5/syncthing-linux-arm64-v2.0.5.tar.gz'; sha256='f8e47cee47473e00793e1a465d86ac511a5af47d4d521438d14d24e9de19109f' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v2.0.5/syncthing-linux-ppc64le-v2.0.5.tar.gz'; sha256='9f22729d4aeb366191752362871182072c1efe63d92d9c6ce3b8e1260f229327' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.5/syncthing-linux-riscv64-v2.0.5.tar.gz'; sha256='03ba66c6ee61da882496c0e45478567f8896abeb97b9ad9e57aedf9dd5d4ea68' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v2.0.5/syncthing-linux-s390x-v2.0.5.tar.gz'; sha256='9d17d9071fc45dc5d9db74aca0097ab9a7ff9a1b2a79f577473a5c86eeb34e6f' ;; \
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
