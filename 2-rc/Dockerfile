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
ENV SYNCTHING_VERSION 2.1.2-rc.4

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v2.1.2-rc.4/syncthing-linux-386-v2.1.2-rc.4.tar.gz'; sha256='8fa774501b01ca7db9948d4f7d4b50628c2c3bb2ba531e69d252065d2a82fcaa' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v2.1.2-rc.4/syncthing-linux-amd64-v2.1.2-rc.4.tar.gz'; sha256='43706cd2248fa6f40d1382349f0b8db8d5c97fe58039ffca12b848db3b4f3493' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v2.1.2-rc.4/syncthing-linux-arm-v2.1.2-rc.4.tar.gz'; sha256='3ebe7b43db4ad1b14253d2d0ac2c865483fa12a62176ccabfda4c3055d857d69' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v2.1.2-rc.4/syncthing-linux-arm-v2.1.2-rc.4.tar.gz'; sha256='3ebe7b43db4ad1b14253d2d0ac2c865483fa12a62176ccabfda4c3055d857d69' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v2.1.2-rc.4/syncthing-linux-arm64-v2.1.2-rc.4.tar.gz'; sha256='203311bd6cc6219e4d5533fc7ee8b79b205372d788dd5557cbf68ee7c2063c97' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v2.1.2-rc.4/syncthing-linux-ppc64le-v2.1.2-rc.4.tar.gz'; sha256='c2893b0d859138bc4fa01776795d4826819bdae2327598cbaeb2773957ef41db' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v2.1.2-rc.4/syncthing-linux-riscv64-v2.1.2-rc.4.tar.gz'; sha256='07116db832ade15f732a01faf2d6547266580f4fea40b0b293a29a1e43cf01c9' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v2.1.2-rc.4/syncthing-linux-s390x-v2.1.2-rc.4.tar.gz'; sha256='d165256bee6b0a185ed1ee8388bd96ba510f0599db46dfb42676753294510670' ;; \
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
