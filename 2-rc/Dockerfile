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
ENV SYNCTHING_VERSION 2.0.0-rc.16

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.16/syncthing-linux-386-v2.0.0-rc.16.tar.gz'; sha256='38029c49e55fe0c5fe79b3960a56aff45d1d291b9d652ef1ee273b32ff634849' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.16/syncthing-linux-amd64-v2.0.0-rc.16.tar.gz'; sha256='cf452e3f3d6fe1dc0c2e1c6e44f6f761c37845bf2e17ecd044b8f899b2eec03b' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.16/syncthing-linux-arm-v2.0.0-rc.16.tar.gz'; sha256='607097e7aa3563ea8c03f33435e76b22720b155399ff08f535e2de3b463aee5c' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.16/syncthing-linux-arm-v2.0.0-rc.16.tar.gz'; sha256='607097e7aa3563ea8c03f33435e76b22720b155399ff08f535e2de3b463aee5c' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.16/syncthing-linux-arm64-v2.0.0-rc.16.tar.gz'; sha256='6843b6c95cbd164bf7507170da59fdca55ea8a59b698083d686f72689ca754fb' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.16/syncthing-linux-ppc64le-v2.0.0-rc.16.tar.gz'; sha256='314107b6103e84e4f1018e2da95f110ba300624213754da5b4f9eb6f8d3c4dec' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.16/syncthing-linux-riscv64-v2.0.0-rc.16.tar.gz'; sha256='1a14ad13b9656a86181cb08a1833eb38581b1a21266a5c5119181dffad16e072' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.16/syncthing-linux-s390x-v2.0.0-rc.16.tar.gz'; sha256='231bf502a9734c320738811baf0b44fac005bb58944b1169f5eee54092e01eb1' ;; \
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
