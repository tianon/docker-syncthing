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
ENV SYNCTHING_VERSION 2.0.0-beta.6

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-beta.6/syncthing-linux-386-v2.0.0-beta.6.tar.gz'; sha256='8291c0f0821d0eba26dc2c839e9a3a6ca37e5f09cd9430ef01aa9d82ce754828' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-beta.6/syncthing-linux-amd64-v2.0.0-beta.6.tar.gz'; sha256='bbf7d62913ed06baaa7d6e3e241fcc03fdf81608c4a86d9664e39d790bca5048' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-beta.6/syncthing-linux-arm-v2.0.0-beta.6.tar.gz'; sha256='a4ee229c8ca3760c60b80cd3296a71bd7d39236e97fd63054081ae179dcb4a0b' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-beta.6/syncthing-linux-arm-v2.0.0-beta.6.tar.gz'; sha256='a4ee229c8ca3760c60b80cd3296a71bd7d39236e97fd63054081ae179dcb4a0b' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-beta.6/syncthing-linux-arm64-v2.0.0-beta.6.tar.gz'; sha256='1e20b28cdbad47b8963b6eb185333645efe16fc7535984f4cc680b75cd4bf33b' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-beta.6/syncthing-linux-ppc64le-v2.0.0-beta.6.tar.gz'; sha256='5c791d3615f52700b111d6e5b0acb509fd88d13130f7a363705d6b5647330169' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-beta.6/syncthing-linux-riscv64-v2.0.0-beta.6.tar.gz'; sha256='c2570befb4dd03f5f2ddc9f1aa8462e8760b1607a4275a0de517fd59354a8235' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-beta.6/syncthing-linux-s390x-v2.0.0-beta.6.tar.gz'; sha256='9d13bc9b3906856637d347dc1e05fd0c30ba061555a31d79acb3b79997725cc3' ;; \
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
