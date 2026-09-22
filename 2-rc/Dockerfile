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
ENV SYNCTHING_VERSION 2.1.6-rc.3

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v2.1.6-rc.3/syncthing-linux-386-v2.1.6-rc.3.tar.gz'; sha256='c1d4aec59f832c4c6cd6682d0b76b080afaddda553d200ad70c55aaa099f587a' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v2.1.6-rc.3/syncthing-linux-amd64-v2.1.6-rc.3.tar.gz'; sha256='c89d9f410a9c699eef0e28c931f7d4a3a671433a53a2d002f1158ac56bce3f2a' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v2.1.6-rc.3/syncthing-linux-arm-v2.1.6-rc.3.tar.gz'; sha256='9bf3e3057dcf0e1eb05af5f792086e3c937a01ccd7194c98acd854f57fb1800c' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v2.1.6-rc.3/syncthing-linux-arm-v2.1.6-rc.3.tar.gz'; sha256='9bf3e3057dcf0e1eb05af5f792086e3c937a01ccd7194c98acd854f57fb1800c' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v2.1.6-rc.3/syncthing-linux-arm64-v2.1.6-rc.3.tar.gz'; sha256='bcaacf5eef449c096c70d249450b9fcf0518575f78ad05780b8a6ec86a195e2c' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v2.1.6-rc.3/syncthing-linux-ppc64le-v2.1.6-rc.3.tar.gz'; sha256='17648550a1d3f92bdeaa853815db01522e1491f7f04bbfa7567bcf479f501d19' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v2.1.6-rc.3/syncthing-linux-riscv64-v2.1.6-rc.3.tar.gz'; sha256='a879e6bd1d44fe1b622e0f46b010393009118f42604f341514a847ef955e3275' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v2.1.6-rc.3/syncthing-linux-s390x-v2.1.6-rc.3.tar.gz'; sha256='bafcddfb2b59684b3fdca0ca8d70ca88e383e49333f9d7fc05972cb32fda2552' ;; \
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
