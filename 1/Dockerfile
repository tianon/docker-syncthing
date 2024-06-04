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
ENV SYNCTHING_VERSION 1.27.8

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v1.27.8/syncthing-linux-386-v1.27.8.tar.gz'; sha256='67681085fe97f2e9ab13f2c5a208e7c6f9641b10af2a18c1b2dff62f5fbc1caf' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.8/syncthing-linux-amd64-v1.27.8.tar.gz'; sha256='c4ad23e9b1cecac50e895db567776671c12fb32e668c5894bfc5ed18eab5529b' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v1.27.8/syncthing-linux-arm-v1.27.8.tar.gz'; sha256='498f6a2d8b64d15fac849503ae987a83c612a4b66fa1d41a488009761cf67924' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v1.27.8/syncthing-linux-arm-v1.27.8.tar.gz'; sha256='498f6a2d8b64d15fac849503ae987a83c612a4b66fa1d41a488009761cf67924' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.8/syncthing-linux-arm64-v1.27.8.tar.gz'; sha256='32e90178895c96e3b2986e4267ebd45a32336a7f85dd630dc9c075c18f5636b8' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v1.27.8/syncthing-linux-ppc64le-v1.27.8.tar.gz'; sha256='55a09db175be62b417227cb14a339d559ae89f38dc49ade3b01ed8d7375f72c2' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.8/syncthing-linux-riscv64-v1.27.8.tar.gz'; sha256='9a7c816eb094777a73013422a057cb368481d89f510c2f03ae59654cfe42221c' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v1.27.8/syncthing-linux-s390x-v1.27.8.tar.gz'; sha256='bc508a9dc9c6f5906b0be87c8363c1f496984f2942cec0e84a0eebc692782ae5' ;; \
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
