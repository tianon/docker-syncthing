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
ENV SYNCTHING_VERSION 1.27.8-rc.2

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v1.27.8-rc.2/syncthing-linux-386-v1.27.8-rc.2.tar.gz'; sha256='3c9cf76cce355f3c6f923b2b6a7b5146c16ebac0be4b17092372f46b4ba0a631' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.8-rc.2/syncthing-linux-amd64-v1.27.8-rc.2.tar.gz'; sha256='9d8c5a6ac12f92303c1a2281ff84743d87d56832ad94e7fc950e8ec9b17fdd1b' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v1.27.8-rc.2/syncthing-linux-arm-v1.27.8-rc.2.tar.gz'; sha256='6dd6cd9b774a46f90caa4faa364c1d63cfe7bcbd7a9184e8dd6e20345544dd17' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v1.27.8-rc.2/syncthing-linux-arm-v1.27.8-rc.2.tar.gz'; sha256='6dd6cd9b774a46f90caa4faa364c1d63cfe7bcbd7a9184e8dd6e20345544dd17' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.8-rc.2/syncthing-linux-arm64-v1.27.8-rc.2.tar.gz'; sha256='60efafbc16e86b11ae66eb00835b23df265b8702833927d65f05576fcf464e86' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v1.27.8-rc.2/syncthing-linux-ppc64le-v1.27.8-rc.2.tar.gz'; sha256='023356e0abee3bdb9a7929129133ddaed056ccb6b7eb76a97e1e0308e9e98a42' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.8-rc.2/syncthing-linux-riscv64-v1.27.8-rc.2.tar.gz'; sha256='22e0e97cc2d376187e7ad13eef4f9be1fb9b8caf37da1c4e2d2fbf1ab6d3fcb2' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v1.27.8-rc.2/syncthing-linux-s390x-v1.27.8-rc.2.tar.gz'; sha256='ce1fe13e6ddd98b0d30342c964c2b343fe4548543dd758f10cfd649469bc3034' ;; \
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
