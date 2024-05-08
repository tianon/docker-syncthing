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
ENV SYNCTHING_VERSION 1.27.7

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v1.27.7/syncthing-linux-386-v1.27.7.tar.gz'; sha256='c2ddec87e5594ca88d1579eef88f818385102674c8dc14c885a19f31efb357a1' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.7/syncthing-linux-amd64-v1.27.7.tar.gz'; sha256='068f3cf972113d101666678dd7b043d9363356667b8c4a81c84b1b54d4d342c3' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v1.27.7/syncthing-linux-arm-v1.27.7.tar.gz'; sha256='3b27649b4745f2289a320d065d9b8e5f20fc220e6c6ddb2ce17a4ce80aa23827' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v1.27.7/syncthing-linux-arm-v1.27.7.tar.gz'; sha256='3b27649b4745f2289a320d065d9b8e5f20fc220e6c6ddb2ce17a4ce80aa23827' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.7/syncthing-linux-arm64-v1.27.7.tar.gz'; sha256='549039456df410368281feef8b3db96e368eb06da61cb35b355ae437feed3ffe' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v1.27.7/syncthing-linux-ppc64le-v1.27.7.tar.gz'; sha256='d0deb018bb6bed9b0bca9cc0f1f868baf5140ccd9a6ce403998dbf2a6594f581' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.7/syncthing-linux-riscv64-v1.27.7.tar.gz'; sha256='b3e168ee653153e3a961aa8062ec547b9a4d82afbb28dff9839a34c5fff343cb' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v1.27.7/syncthing-linux-s390x-v1.27.7.tar.gz'; sha256='428f5a9460049880b0b5822f0d67924d9c75fdd61d0e8ffaaea18dade8338ee4' ;; \
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
