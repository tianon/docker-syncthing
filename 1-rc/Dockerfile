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
ENV SYNCTHING_VERSION 1.27.13-rc.1

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v1.27.13-rc.1/syncthing-linux-386-v1.27.13-rc.1.tar.gz'; sha256='2c5f0291736891f07cde4b906d218d262373858bb83bee02579859ccc4d8c029' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.13-rc.1/syncthing-linux-amd64-v1.27.13-rc.1.tar.gz'; sha256='dac3bea9cb71ee2bd4f51767876adcd2b0531611a0b53a539893061d584bc141' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v1.27.13-rc.1/syncthing-linux-arm-v1.27.13-rc.1.tar.gz'; sha256='a8ff52c769649c2665c01abecdb352daa922e6d9e3bc867466bbacbae08a36b2' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v1.27.13-rc.1/syncthing-linux-arm-v1.27.13-rc.1.tar.gz'; sha256='a8ff52c769649c2665c01abecdb352daa922e6d9e3bc867466bbacbae08a36b2' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.13-rc.1/syncthing-linux-arm64-v1.27.13-rc.1.tar.gz'; sha256='a95b53d881ef441e9c3cd0f52a4218f410423ca422636bb0ae7c3b08fab82b49' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v1.27.13-rc.1/syncthing-linux-ppc64le-v1.27.13-rc.1.tar.gz'; sha256='c8e1528f15a90796b2a995de83a8ef56a8959a8f911044541ae5764bda24738d' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.13-rc.1/syncthing-linux-riscv64-v1.27.13-rc.1.tar.gz'; sha256='2be3c2c350b49491d76ba270dc06c79d102268bf7b08e042af2c5ad1a5f58514' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v1.27.13-rc.1/syncthing-linux-s390x-v1.27.13-rc.1.tar.gz'; sha256='1e38c751fdf8d52a50695fc7b3b7a49e660d2507ac31af03b6c19a9e34925c84' ;; \
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
