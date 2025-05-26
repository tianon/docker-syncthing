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
ENV SYNCTHING_VERSION 1.29.7-rc.2

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v1.29.7-rc.2/syncthing-linux-386-v1.29.7-rc.2.tar.gz'; sha256='d1dc9e4c59508e585222204d82e59a0ee388b1754564431d6e06815f5ac6a0fd' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v1.29.7-rc.2/syncthing-linux-amd64-v1.29.7-rc.2.tar.gz'; sha256='e556b08fe15906f1297f7167eeb95fabf79333b38751dbe98bf7a5c5bdbbde62' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v1.29.7-rc.2/syncthing-linux-arm-v1.29.7-rc.2.tar.gz'; sha256='1780eb4b2ba33574046bafbe6495b6b08a239f1fba7f7eb9ceed245fd373041e' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v1.29.7-rc.2/syncthing-linux-arm-v1.29.7-rc.2.tar.gz'; sha256='1780eb4b2ba33574046bafbe6495b6b08a239f1fba7f7eb9ceed245fd373041e' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v1.29.7-rc.2/syncthing-linux-arm64-v1.29.7-rc.2.tar.gz'; sha256='d12cd8bd993638f5ab702577c8311f86ebfed6662c10b820d708d024de53bb20' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v1.29.7-rc.2/syncthing-linux-ppc64le-v1.29.7-rc.2.tar.gz'; sha256='bd07cb6b50f908b88f607093188294c4f1085e1272cc2259d23b52bb5bcdfbe5' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v1.29.7-rc.2/syncthing-linux-riscv64-v1.29.7-rc.2.tar.gz'; sha256='85e0419145ebb2a706f78ca49335abeedb3fe0c8cc1e79b469d45d86ec7c829a' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v1.29.7-rc.2/syncthing-linux-s390x-v1.29.7-rc.2.tar.gz'; sha256='830f72a063e57183dfb37770c09e326172aff8d81a26d60216857d2914216695' ;; \
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
