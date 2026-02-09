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
ENV SYNCTHING_VERSION 2.0.14-rc.2

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v2.0.14-rc.2/syncthing-linux-386-v2.0.14-rc.2.tar.gz'; sha256='0cff0e27d402838bd0bd66716e7dc4214cfef12ab3ce0ede7be41a19d6575885' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.14-rc.2/syncthing-linux-amd64-v2.0.14-rc.2.tar.gz'; sha256='c94f82dab0e5e2fe34dc2e053be674dbd9dceb4daedb5ab68074e7d04140d11e' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v2.0.14-rc.2/syncthing-linux-arm-v2.0.14-rc.2.tar.gz'; sha256='b8e21f4b3b8d73c922fc28f55c0ae6e23f4e08ff216c0644d4ec6364c049bda6' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v2.0.14-rc.2/syncthing-linux-arm-v2.0.14-rc.2.tar.gz'; sha256='b8e21f4b3b8d73c922fc28f55c0ae6e23f4e08ff216c0644d4ec6364c049bda6' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.14-rc.2/syncthing-linux-arm64-v2.0.14-rc.2.tar.gz'; sha256='4cd6b544ae53196615cc90de500a995ac520fc9d0ce4862c62eca74a6084b166' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v2.0.14-rc.2/syncthing-linux-ppc64le-v2.0.14-rc.2.tar.gz'; sha256='a7180409aec3707f01f3c9b2ff8e65ef57ca9fa200ac6db3871ec53f44e73ff0' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.14-rc.2/syncthing-linux-riscv64-v2.0.14-rc.2.tar.gz'; sha256='1bbbacbb182406c1a0c16e97aad0c89b4a2f6d587f3a0f1fffd6b0343c82cdd2' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v2.0.14-rc.2/syncthing-linux-s390x-v2.0.14-rc.2.tar.gz'; sha256='4ebe119554a9775d556a14159407ae65e435d17761f528c6cd57f3be1686f940' ;; \
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
