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
ENV SYNCTHING_VERSION 2.1.3-rc.1

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v2.1.3-rc.1/syncthing-linux-386-v2.1.3-rc.1.tar.gz'; sha256='e7b479e38be10fc6695fe8344545b423379ec7ea9c2f7f9ee63f4df46515bf82' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v2.1.3-rc.1/syncthing-linux-amd64-v2.1.3-rc.1.tar.gz'; sha256='422348539b5efa3e87194cb8f0e92195f3cf553cd9d44946cd48f848229636c0' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v2.1.3-rc.1/syncthing-linux-arm-v2.1.3-rc.1.tar.gz'; sha256='353ecc0663ba2028ffaf6defcaf7460f7f17bc43e2138b2f221eaed6c087fd8a' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v2.1.3-rc.1/syncthing-linux-arm-v2.1.3-rc.1.tar.gz'; sha256='353ecc0663ba2028ffaf6defcaf7460f7f17bc43e2138b2f221eaed6c087fd8a' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v2.1.3-rc.1/syncthing-linux-arm64-v2.1.3-rc.1.tar.gz'; sha256='ee5a4e2016376135fba8bc1587da41bcdde586b1c2662166ff162bd7cd5db86e' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v2.1.3-rc.1/syncthing-linux-ppc64le-v2.1.3-rc.1.tar.gz'; sha256='93945b4c7bd59ad1bf77d56696923ebf683bb2023326f947183d2c89078f035f' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v2.1.3-rc.1/syncthing-linux-riscv64-v2.1.3-rc.1.tar.gz'; sha256='9f88caadcc76c71dd5845a0971e63e5653d53a1a8c726c21bc7a14a0683f3051' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v2.1.3-rc.1/syncthing-linux-s390x-v2.1.3-rc.1.tar.gz'; sha256='95164c160538d26b5ab72eb5f69d2fd376b54da889563154bbac7b57426b5493' ;; \
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
