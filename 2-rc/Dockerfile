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
ENV SYNCTHING_VERSION 2.1.0-rc.2

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v2.1.0-rc.2/syncthing-linux-386-v2.1.0-rc.2.tar.gz'; sha256='dff1808251ccfe7f925df8d088cc38186f48da7602b2343b8cf0f6d9a8b3e1d2' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v2.1.0-rc.2/syncthing-linux-amd64-v2.1.0-rc.2.tar.gz'; sha256='6768ef9fa593ca51f32aaf4d1e81c9fb2854030bf18fcb0fa194b8ee929a401e' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v2.1.0-rc.2/syncthing-linux-arm-v2.1.0-rc.2.tar.gz'; sha256='992d51cb3902fd15196fb5eaadcb33e0fa9a7e3309964b775f34e72404b368a2' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v2.1.0-rc.2/syncthing-linux-arm-v2.1.0-rc.2.tar.gz'; sha256='992d51cb3902fd15196fb5eaadcb33e0fa9a7e3309964b775f34e72404b368a2' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v2.1.0-rc.2/syncthing-linux-arm64-v2.1.0-rc.2.tar.gz'; sha256='f86ffb2a8be0e19c66bcfbba4cf0feb69727bbe821eb02feea4aa3ce50106c4e' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v2.1.0-rc.2/syncthing-linux-ppc64le-v2.1.0-rc.2.tar.gz'; sha256='15edefe9202c162e528285003de3a244b7fcc5238561c8b656a3077d323f51ae' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v2.1.0-rc.2/syncthing-linux-riscv64-v2.1.0-rc.2.tar.gz'; sha256='d74368dcdc3088341872faab9374d8ee8758d9ada273fd16d4aba6fd2be55ff5' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v2.1.0-rc.2/syncthing-linux-s390x-v2.1.0-rc.2.tar.gz'; sha256='f5ea202205646a4bc3bc185e3f75d7a14c158ed6d2785c3ee3445494e43c498e' ;; \
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
