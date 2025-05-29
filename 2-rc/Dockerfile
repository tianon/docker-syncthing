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
ENV SYNCTHING_VERSION 2.0.0-rc.18

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.18/syncthing-linux-386-v2.0.0-rc.18.tar.gz'; sha256='c1dde7f62b55c36d3a57f605ad244bd3b516ab3a858c277230cdeb42d0126f3e' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.18/syncthing-linux-amd64-v2.0.0-rc.18.tar.gz'; sha256='b443d07c8f8e1c57894f28f0f48757734d99c53ea544c50d9b12687d48bb9d4a' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.18/syncthing-linux-arm-v2.0.0-rc.18.tar.gz'; sha256='ac86b395dfd16a69140d2469361057ba59218097c667a87354b3967d05ed81ae' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.18/syncthing-linux-arm-v2.0.0-rc.18.tar.gz'; sha256='ac86b395dfd16a69140d2469361057ba59218097c667a87354b3967d05ed81ae' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.18/syncthing-linux-arm64-v2.0.0-rc.18.tar.gz'; sha256='f373cc87c9949a57aa97ee7765017589b4a286ac3cd7ec9db1b2d6098ac0b8ee' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.18/syncthing-linux-ppc64le-v2.0.0-rc.18.tar.gz'; sha256='84e1ddcd489730566edc6be78ae0d3f60ed637918f675bcec651abb992a874c2' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.18/syncthing-linux-riscv64-v2.0.0-rc.18.tar.gz'; sha256='9efe1f5ae9a00ef76deee75b435ec23bfe6830d0a3ab413cb0d51ba84cf59e3f' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.18/syncthing-linux-s390x-v2.0.0-rc.18.tar.gz'; sha256='c78b0b6ad724d244c70c855e1daa3290f8073dede68c54e69b764e101f747c66' ;; \
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
