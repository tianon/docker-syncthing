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
ENV SYNCTHING_VERSION 2.1.3-rc.2

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v2.1.3-rc.2/syncthing-linux-386-v2.1.3-rc.2.tar.gz'; sha256='4acf32a6961ce1c9ae96af03b2b07c3cf0174b0d5fb902ec11c6afc0a5ac163f' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v2.1.3-rc.2/syncthing-linux-amd64-v2.1.3-rc.2.tar.gz'; sha256='cedb96ca0599aa7ef15c1569fb78e67dc5120ef6f6046a6544f994628c00659f' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v2.1.3-rc.2/syncthing-linux-arm-v2.1.3-rc.2.tar.gz'; sha256='eb88a7f18a4bdfa92edc9aac112cecc977a20582d33292f7dc9e8a0f66d75ce5' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v2.1.3-rc.2/syncthing-linux-arm-v2.1.3-rc.2.tar.gz'; sha256='eb88a7f18a4bdfa92edc9aac112cecc977a20582d33292f7dc9e8a0f66d75ce5' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v2.1.3-rc.2/syncthing-linux-arm64-v2.1.3-rc.2.tar.gz'; sha256='68cf4f75814f67effe9579bbdcf9a46f437c5016bab72c7ca9602adc5d9a0fea' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v2.1.3-rc.2/syncthing-linux-ppc64le-v2.1.3-rc.2.tar.gz'; sha256='98dc5132093d9913b095e9994f84233464f2326e1ea1429aa611443e49d89d37' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v2.1.3-rc.2/syncthing-linux-riscv64-v2.1.3-rc.2.tar.gz'; sha256='4958d73dc26d7c86b104318b6e58ba50344431343d813c39cff10c47499bca3f' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v2.1.3-rc.2/syncthing-linux-s390x-v2.1.3-rc.2.tar.gz'; sha256='91fe01198219b6ba8aee909a2c9679cad91804b39220bb361a3d34b38b088dfb' ;; \
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
