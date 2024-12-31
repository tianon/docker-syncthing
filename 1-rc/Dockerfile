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
ENV SYNCTHING_VERSION 1.29.0-rc.3

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v1.29.0-rc.3/syncthing-linux-386-v1.29.0-rc.3.tar.gz'; sha256='5bc296f3ba2745ef76663929ea51d1f0ba51c54cf390de1b9bda054f56e193ed' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v1.29.0-rc.3/syncthing-linux-amd64-v1.29.0-rc.3.tar.gz'; sha256='665657eb9bd0556f3019905be18040c5b99aae59823cf64b04a6aeeacf471c61' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v1.29.0-rc.3/syncthing-linux-arm-v1.29.0-rc.3.tar.gz'; sha256='f98725bf248f034a0148760f644202c80d774e3359034999c0b0e0d8e2e7a70a' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v1.29.0-rc.3/syncthing-linux-arm-v1.29.0-rc.3.tar.gz'; sha256='f98725bf248f034a0148760f644202c80d774e3359034999c0b0e0d8e2e7a70a' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v1.29.0-rc.3/syncthing-linux-arm64-v1.29.0-rc.3.tar.gz'; sha256='33258a6b52a930fc983c1cee63bd1fc6865b2efda11e494ef87c559303e7077d' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v1.29.0-rc.3/syncthing-linux-ppc64le-v1.29.0-rc.3.tar.gz'; sha256='af104400b2ed8909b5bf9c5973615d1b7da7b6a3474ad65cb127a2479e76051b' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v1.29.0-rc.3/syncthing-linux-riscv64-v1.29.0-rc.3.tar.gz'; sha256='63fbe942cfb093899fb38c3fd62744cbee70c5a70699453a9fbf1b84d6854694' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v1.29.0-rc.3/syncthing-linux-s390x-v1.29.0-rc.3.tar.gz'; sha256='86701d8f0aba1d1922af23dc559ea846961e5bef54295b2d4279470c5027771f' ;; \
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
