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
ENV SYNCTHING_VERSION 1.26.0-rc.1

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v1.26.0-rc.1/syncthing-linux-386-v1.26.0-rc.1.tar.gz'; sha256='7f0329802980440333107d5333a87e8c42e15532e97d6556c7003f9b864b3c39' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v1.26.0-rc.1/syncthing-linux-amd64-v1.26.0-rc.1.tar.gz'; sha256='ef53a0808db4fffb43418399f1681d044dc39a0d0067858ab4eb5ac7736ad39c' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v1.26.0-rc.1/syncthing-linux-arm-v1.26.0-rc.1.tar.gz'; sha256='349618abb7e37c7178d4adc5bdc002d7cdc0c7ece21e35965ccde8cce0e73caa' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v1.26.0-rc.1/syncthing-linux-arm-v1.26.0-rc.1.tar.gz'; sha256='349618abb7e37c7178d4adc5bdc002d7cdc0c7ece21e35965ccde8cce0e73caa' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v1.26.0-rc.1/syncthing-linux-arm64-v1.26.0-rc.1.tar.gz'; sha256='2776d03014bcb4bfd5a1c3353ae83dfb0b7ad9399798ea0ef0b6f8f24f6b22b9' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v1.26.0-rc.1/syncthing-linux-ppc64le-v1.26.0-rc.1.tar.gz'; sha256='4dab5d7e51e4e7d3f9aaba7d7b52af996934787c24a6d7184f05254c37b57e31' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v1.26.0-rc.1/syncthing-linux-riscv64-v1.26.0-rc.1.tar.gz'; sha256='d33592805d87b8f9773d283628efdf82146a056234173a9ebdc93e91eeaacf50' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v1.26.0-rc.1/syncthing-linux-s390x-v1.26.0-rc.1.tar.gz'; sha256='7e57c91402a2608262e49aa579f0c81a9b28c025740686411732084aaf7c36ff' ;; \
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
