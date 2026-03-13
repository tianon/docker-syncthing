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
ENV SYNCTHING_VERSION 2.0.16-rc.2

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v2.0.16-rc.2/syncthing-linux-386-v2.0.16-rc.2.tar.gz'; sha256='5dbeeba60456416f65b475cbb5012d99f7926f0fe77d2f4073538d069d0182e1' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.16-rc.2/syncthing-linux-amd64-v2.0.16-rc.2.tar.gz'; sha256='1daa839d06bd6f23d995e8ff9fcfe30b0dfb7f98e04cd79c8359216a4c7b1c96' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v2.0.16-rc.2/syncthing-linux-arm-v2.0.16-rc.2.tar.gz'; sha256='499fd65e4b278858d38fd7482a6f6641182dea4a6dc3f8fcd4341a5f6a430b98' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v2.0.16-rc.2/syncthing-linux-arm-v2.0.16-rc.2.tar.gz'; sha256='499fd65e4b278858d38fd7482a6f6641182dea4a6dc3f8fcd4341a5f6a430b98' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.16-rc.2/syncthing-linux-arm64-v2.0.16-rc.2.tar.gz'; sha256='5b4202cfcd96108c9cc002703ee82f133d7e12685904f0e12d2019ecd3fe9d80' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v2.0.16-rc.2/syncthing-linux-ppc64le-v2.0.16-rc.2.tar.gz'; sha256='ddaa4a0793090472f07361b89c0f49b4668104219d627539e2195e54b42c36d0' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.16-rc.2/syncthing-linux-riscv64-v2.0.16-rc.2.tar.gz'; sha256='230f5238442ad0c30ce3a3eef6ee7ed51abfc7157b5ac13a22176bc80bc855c5' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v2.0.16-rc.2/syncthing-linux-s390x-v2.0.16-rc.2.tar.gz'; sha256='088386dc6bcb81160c2660f3cf444aee5eee2b744d546f50467d2c90e6960a43' ;; \
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
