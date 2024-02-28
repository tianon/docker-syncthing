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
ENV SYNCTHING_VERSION 1.27.4-rc.2

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v1.27.4-rc.2/syncthing-linux-386-v1.27.4-rc.2.tar.gz'; sha256='a23f6f7641b7ab59f47ae8b83428676b64c91568246a9a6c4b65d094f2a873c6' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.4-rc.2/syncthing-linux-amd64-v1.27.4-rc.2.tar.gz'; sha256='f042045a3338cf2245428adeeb875eb03c06b6abd999e9c0db5fbf869ca1c86b' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v1.27.4-rc.2/syncthing-linux-arm-v1.27.4-rc.2.tar.gz'; sha256='b5c0e18fe0fcb9ce824b7565c045b9bc966c888ada522024ddfb72e0647086d9' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v1.27.4-rc.2/syncthing-linux-arm-v1.27.4-rc.2.tar.gz'; sha256='b5c0e18fe0fcb9ce824b7565c045b9bc966c888ada522024ddfb72e0647086d9' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.4-rc.2/syncthing-linux-arm64-v1.27.4-rc.2.tar.gz'; sha256='3e42a004b3698907b459f22ff6cbff58f6c9cb78ffc31b641601e1d5ba393dcb' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v1.27.4-rc.2/syncthing-linux-ppc64le-v1.27.4-rc.2.tar.gz'; sha256='0c55e3ab9d9df6389c55545cb6d2bf36e7a059a46699844178b3a1b10b481386' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.4-rc.2/syncthing-linux-riscv64-v1.27.4-rc.2.tar.gz'; sha256='e9939ca5514778869eb54feda48a918be647a97c35094540bbe8c130a0fa8444' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v1.27.4-rc.2/syncthing-linux-s390x-v1.27.4-rc.2.tar.gz'; sha256='8c0caeac3f22c60af8ac63af2c816ab1e3800a27411700f4090c06e795439bc8' ;; \
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
