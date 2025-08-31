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
ENV SYNCTHING_VERSION 2.0.4-rc.1

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v2.0.4-rc.1/syncthing-linux-386-v2.0.4-rc.1.tar.gz'; sha256='f5cddcbc59ea90d05bb1e6028edcd22f75af31c7cc0b142d011f7c6777a2e69e' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.4-rc.1/syncthing-linux-amd64-v2.0.4-rc.1.tar.gz'; sha256='313a7354458670de395225045b75e44601feb65acd18a5ae2007d7446df3885a' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v2.0.4-rc.1/syncthing-linux-arm-v2.0.4-rc.1.tar.gz'; sha256='0657fb29c73565b1c7bbc8b4ff5cfee726dc03a0d8b33f1c837fbb4c6ff57dc6' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v2.0.4-rc.1/syncthing-linux-arm-v2.0.4-rc.1.tar.gz'; sha256='0657fb29c73565b1c7bbc8b4ff5cfee726dc03a0d8b33f1c837fbb4c6ff57dc6' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.4-rc.1/syncthing-linux-arm64-v2.0.4-rc.1.tar.gz'; sha256='4a94b83a95b068cf000af04b9feabe2ea9bde2697b11df2f754b4a7358d1cc24' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v2.0.4-rc.1/syncthing-linux-ppc64le-v2.0.4-rc.1.tar.gz'; sha256='78a8ec33b20062f1e7ccc2c0e77d61937dc0a4b436d609350d027ef8a73beeb7' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.4-rc.1/syncthing-linux-riscv64-v2.0.4-rc.1.tar.gz'; sha256='1a95352945fc57c003538eeae5c0005fc9ab05be070faaad89fd2f38883b3ea3' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v2.0.4-rc.1/syncthing-linux-s390x-v2.0.4-rc.1.tar.gz'; sha256='2858fdf8dd82d6e296f177b64d579f3c56b5c5c711ee6a27527547c9078d786a' ;; \
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
