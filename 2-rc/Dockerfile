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
ENV SYNCTHING_VERSION 2.0.13-rc.1

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v2.0.13-rc.1/syncthing-linux-386-v2.0.13-rc.1.tar.gz'; sha256='449e7aec054619b0f14d9ba050883a3d8b80e5830c9a83f3a6a839d68e61524e' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.13-rc.1/syncthing-linux-amd64-v2.0.13-rc.1.tar.gz'; sha256='59ee88e4ef3a2f8d86ad912c24344b80a3d2dadd829a2b36ef41f012bc0cbe3f' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v2.0.13-rc.1/syncthing-linux-arm-v2.0.13-rc.1.tar.gz'; sha256='2fc274a492025600bf29feecf3c9e306ec227f17ac7fcb3b2eb688390fbd1759' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v2.0.13-rc.1/syncthing-linux-arm-v2.0.13-rc.1.tar.gz'; sha256='2fc274a492025600bf29feecf3c9e306ec227f17ac7fcb3b2eb688390fbd1759' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.13-rc.1/syncthing-linux-arm64-v2.0.13-rc.1.tar.gz'; sha256='b2170fcc78cc614ff69966e14b4887c40de1d9fffedfaaf67bf6026232fda7ec' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v2.0.13-rc.1/syncthing-linux-ppc64le-v2.0.13-rc.1.tar.gz'; sha256='e5f8c30f538d8f99fc2c63a7552786388d072cd48fde35ac16c330aa91a219af' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.13-rc.1/syncthing-linux-riscv64-v2.0.13-rc.1.tar.gz'; sha256='83e0610a97756bb6eed070476106b608db1e4764e83fd3430bf119ddfeee0f85' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v2.0.13-rc.1/syncthing-linux-s390x-v2.0.13-rc.1.tar.gz'; sha256='8f780f6b21cdcfcfc1dc2d34ace3b433cbe0d3c6a4fe986c3620cb3a35e44623' ;; \
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
