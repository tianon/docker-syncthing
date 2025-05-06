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
ENV SYNCTHING_VERSION 1.29.6

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v1.29.6/syncthing-linux-386-v1.29.6.tar.gz'; sha256='64009d988cd7cecd48bd84fd206f5ec555584cd6195b296938845ce79e56d4fe' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v1.29.6/syncthing-linux-amd64-v1.29.6.tar.gz'; sha256='422ae49c7f35a8b786596c73f6968fcb79fd50dfa559cf17dbb0cdf07e3b2537' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v1.29.6/syncthing-linux-arm-v1.29.6.tar.gz'; sha256='68dd086aba83073a0eb35148dcb7acd011b008e2e74385bdfffaf1eff266e6f7' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v1.29.6/syncthing-linux-arm-v1.29.6.tar.gz'; sha256='68dd086aba83073a0eb35148dcb7acd011b008e2e74385bdfffaf1eff266e6f7' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v1.29.6/syncthing-linux-arm64-v1.29.6.tar.gz'; sha256='7bf0b75dcca970eedf9fb59325a546257f694eab06239d18b364f647bf6e9992' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v1.29.6/syncthing-linux-ppc64le-v1.29.6.tar.gz'; sha256='998eb17af40816a5ed8b65f24fb966f8d3d8d9695be75d443832896fb38ab7cf' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v1.29.6/syncthing-linux-riscv64-v1.29.6.tar.gz'; sha256='272a84794cff6d4d697862fa03e590cb76ba35a3b9c32e4c2d2140eadc283ebe' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v1.29.6/syncthing-linux-s390x-v1.29.6.tar.gz'; sha256='ba620c8c00b5d084a26d72da8dad582c44776e131fb893b04922c32f155f4b65' ;; \
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
