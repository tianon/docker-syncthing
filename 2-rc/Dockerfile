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
ENV SYNCTHING_VERSION 2.1.2-rc.2

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v2.1.2-rc.2/syncthing-linux-386-v2.1.2-rc.2.tar.gz'; sha256='7c9f342d509b0f9948ff3b78a8b8409085d3a2bb950c521a7d33ff3f915ae3ff' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v2.1.2-rc.2/syncthing-linux-amd64-v2.1.2-rc.2.tar.gz'; sha256='a9f3c794111a1c2eca0d2971e729990401355e5676d35059aec6e2b57cb5f6c6' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v2.1.2-rc.2/syncthing-linux-arm-v2.1.2-rc.2.tar.gz'; sha256='4c3f7f4bac79f6461b30e6633e16fb78ca28f52b5051922acf8fd14b9f8e7b20' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v2.1.2-rc.2/syncthing-linux-arm-v2.1.2-rc.2.tar.gz'; sha256='4c3f7f4bac79f6461b30e6633e16fb78ca28f52b5051922acf8fd14b9f8e7b20' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v2.1.2-rc.2/syncthing-linux-arm64-v2.1.2-rc.2.tar.gz'; sha256='c49e57f120f5b00529b2d6be163138005ab16b64e5ccb833d3e7ae9280f72cfb' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v2.1.2-rc.2/syncthing-linux-ppc64le-v2.1.2-rc.2.tar.gz'; sha256='d260172c339503c993b83d8d9c897f789c33ed4ad3538772257b2a0530e2470e' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v2.1.2-rc.2/syncthing-linux-riscv64-v2.1.2-rc.2.tar.gz'; sha256='791c2e2bf1c6405fcf94551a6af59cc5d2cd3d3f4d6bd92172821066ac4aac35' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v2.1.2-rc.2/syncthing-linux-s390x-v2.1.2-rc.2.tar.gz'; sha256='4ac1bbe1c86ba4668880cfe70a90329a54832257cef690862bbee39818fe6343' ;; \
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
