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
ENV SYNCTHING_VERSION 2.0.0-rc.15

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.15/syncthing-linux-386-v2.0.0-rc.15.tar.gz'; sha256='8974eac7c67ce9834820e7d2e3e107e764ca94dbaf9f8c5f258445cf0791e856' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.15/syncthing-linux-amd64-v2.0.0-rc.15.tar.gz'; sha256='d639f802cbbc6b13a4a7dddcc070eca7bb7bf50bda655dec355bea94bec2a689' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.15/syncthing-linux-arm-v2.0.0-rc.15.tar.gz'; sha256='c6bb340d7246946b3410f957b3b9cbcec4f71bb243d89d196d485cadabed19a4' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.15/syncthing-linux-arm-v2.0.0-rc.15.tar.gz'; sha256='c6bb340d7246946b3410f957b3b9cbcec4f71bb243d89d196d485cadabed19a4' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.15/syncthing-linux-arm64-v2.0.0-rc.15.tar.gz'; sha256='e439159da82f1bf57ae40d698ed0e04b1223b2e47a562dcf20b3dc56ad4def52' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.15/syncthing-linux-ppc64le-v2.0.0-rc.15.tar.gz'; sha256='96f379186a3057cf065ccce650ea5e8bb9d4b4b327a17960eccbf5cdc8fa52ee' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.15/syncthing-linux-riscv64-v2.0.0-rc.15.tar.gz'; sha256='2d6c850082903ce1f36fd4ae9b3245395ff48894deb8696b6e8657927ae49aa2' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.15/syncthing-linux-s390x-v2.0.0-rc.15.tar.gz'; sha256='1de00a07175751a60753659ebf9f17f171bc64279b0e6223097b6d445b44baa3' ;; \
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
