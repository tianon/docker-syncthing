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
ENV SYNCTHING_VERSION 1.27.7-rc.1

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v1.27.7-rc.1/syncthing-linux-386-v1.27.7-rc.1.tar.gz'; sha256='bd4b8b09ccd024dc2806f78da00cff309cbe2729c1706234d0ef9d09a6504aab' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.7-rc.1/syncthing-linux-amd64-v1.27.7-rc.1.tar.gz'; sha256='de46e163d35d1c4405b86496ba0b8985c72c9125ab7f8415526d48019dfa96ce' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v1.27.7-rc.1/syncthing-linux-arm-v1.27.7-rc.1.tar.gz'; sha256='d5e3d5dcb75b69117197fccaeb55f516d1abe1c8b17b074cef0bec55fdc851bd' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v1.27.7-rc.1/syncthing-linux-arm-v1.27.7-rc.1.tar.gz'; sha256='d5e3d5dcb75b69117197fccaeb55f516d1abe1c8b17b074cef0bec55fdc851bd' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.7-rc.1/syncthing-linux-arm64-v1.27.7-rc.1.tar.gz'; sha256='88cb9a6d5cea76ff031c075711abe2efcd33d146fd80ca7d6ffe8cf0eca7af92' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v1.27.7-rc.1/syncthing-linux-ppc64le-v1.27.7-rc.1.tar.gz'; sha256='5cd7e6b0a425afd295e636fd49daed27a883d01f7eb46dc53cd24f2da9d1c94f' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.7-rc.1/syncthing-linux-riscv64-v1.27.7-rc.1.tar.gz'; sha256='119b7a18538de01b79dcafb42f0e9be9ce374ffb7d76a541286e14fd4397a8de' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v1.27.7-rc.1/syncthing-linux-s390x-v1.27.7-rc.1.tar.gz'; sha256='129a56f17f8d550c6998e68d40a62af934cf7fdc32e9c1e7628bd0f6230326df' ;; \
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
