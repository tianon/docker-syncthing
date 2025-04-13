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
ENV SYNCTHING_VERSION 1.29.6-rc.1

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v1.29.6-rc.1/syncthing-linux-386-v1.29.6-rc.1.tar.gz'; sha256='cc99b766dbe4486fbd2cca260644708292d8c0330c4ed523f9eea35d513077dc' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v1.29.6-rc.1/syncthing-linux-amd64-v1.29.6-rc.1.tar.gz'; sha256='aedb35049ebd181ae8817c92c97ba529ad346b447d2ea718e40c1056c64a7829' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v1.29.6-rc.1/syncthing-linux-arm-v1.29.6-rc.1.tar.gz'; sha256='b3e9985dbafee36ec6878ef5b518f5c77f93b34aeae809d40382ff47175b41ae' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v1.29.6-rc.1/syncthing-linux-arm-v1.29.6-rc.1.tar.gz'; sha256='b3e9985dbafee36ec6878ef5b518f5c77f93b34aeae809d40382ff47175b41ae' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v1.29.6-rc.1/syncthing-linux-arm64-v1.29.6-rc.1.tar.gz'; sha256='cf4dbc9ef99e53352d82ba81c544deb6d75af094700752633bd6171e1e2d23a3' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v1.29.6-rc.1/syncthing-linux-ppc64le-v1.29.6-rc.1.tar.gz'; sha256='53fa408ada49e4db0c29dae6d8dec06a9ed75178d01a414a14e3d98acd102271' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v1.29.6-rc.1/syncthing-linux-riscv64-v1.29.6-rc.1.tar.gz'; sha256='064f32c5cbb44215fffdd32c0e081a2e62ddc7e964065b755a3686da768636bf' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v1.29.6-rc.1/syncthing-linux-s390x-v1.29.6-rc.1.tar.gz'; sha256='8d5ba1001c1ec077dcd129df78d8a6c39bd8398c5290c9047cebf63c98cbb985' ;; \
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
