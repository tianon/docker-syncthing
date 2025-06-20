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
ENV SYNCTHING_VERSION 2.0.0-rc.22

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.22/syncthing-linux-386-v2.0.0-rc.22.tar.gz'; sha256='17e2a64fcc32d17fd75e26b84d7b8d215ae5db1abb78a3539fc058a9c5bcd572' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.22/syncthing-linux-amd64-v2.0.0-rc.22.tar.gz'; sha256='32bd93584619dccaf94c74623383afe886dd810d6dcf51d12ee2df36d36dc11b' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.22/syncthing-linux-arm-v2.0.0-rc.22.tar.gz'; sha256='642dcd4d8970b01809f674c44da49b235e095a8d6dcedbdf63cff62b3b096021' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.22/syncthing-linux-arm-v2.0.0-rc.22.tar.gz'; sha256='642dcd4d8970b01809f674c44da49b235e095a8d6dcedbdf63cff62b3b096021' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.22/syncthing-linux-arm64-v2.0.0-rc.22.tar.gz'; sha256='f4b73152bfdb7da716d6eae97c31200cb951ff5a69fbad34ea6c0947fde74e13' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.22/syncthing-linux-ppc64le-v2.0.0-rc.22.tar.gz'; sha256='cc9c0e2b99ab1bcaadd1395bbd6f5efb12134e5b79dc9ffb032b4ae536d71148' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.22/syncthing-linux-riscv64-v2.0.0-rc.22.tar.gz'; sha256='fc211ec746ff8a9eb74d896eb2cd702c7fb8c96212ced194b08185b48a1d54f3' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.22/syncthing-linux-s390x-v2.0.0-rc.22.tar.gz'; sha256='45d2046ed8a9e00fcd2d27c8340cea89d4ff764c3b8f645991c233f9226f397e' ;; \
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
