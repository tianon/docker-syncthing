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
ENV SYNCTHING_VERSION 1.25.0-rc.2

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v1.25.0-rc.2/syncthing-linux-386-v1.25.0-rc.2.tar.gz'; sha256='5de99c8e012c93671d13fa82f498ab3d64b99f7997b621f33feddb87aabb55a3' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v1.25.0-rc.2/syncthing-linux-amd64-v1.25.0-rc.2.tar.gz'; sha256='62acdeecac7bf09c6224e8204ae34dca8aaac4f2e02756e4a5d3419bd6f40a6d' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v1.25.0-rc.2/syncthing-linux-arm-v1.25.0-rc.2.tar.gz'; sha256='2ab08871f96e05718de77ee8fa1a6e6c232b6cff3031a2aef668ccbeb7f6aeb5' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v1.25.0-rc.2/syncthing-linux-arm-v1.25.0-rc.2.tar.gz'; sha256='2ab08871f96e05718de77ee8fa1a6e6c232b6cff3031a2aef668ccbeb7f6aeb5' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v1.25.0-rc.2/syncthing-linux-arm64-v1.25.0-rc.2.tar.gz'; sha256='7926264264fa94677ffb1d7d0d2f31815b597b5fd89ea3278b6fed752faa398c' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v1.25.0-rc.2/syncthing-linux-ppc64le-v1.25.0-rc.2.tar.gz'; sha256='dc71b6f68ac21015ef1ef5ef74dea5459330a05347bd29d989db48b3b3a108b3' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v1.25.0-rc.2/syncthing-linux-riscv64-v1.25.0-rc.2.tar.gz'; sha256='f63b6e1948027ae68452541614bd1584e50da9164853e482e90fef55fa73d5e3' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v1.25.0-rc.2/syncthing-linux-s390x-v1.25.0-rc.2.tar.gz'; sha256='0368fe6c3baa749961bff09dbc70e6ddc61c307d1b2153153c66f1cbeb1dfbcc' ;; \
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
