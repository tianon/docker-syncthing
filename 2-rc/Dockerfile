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
ENV SYNCTHING_VERSION 2.1.4-rc.2

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v2.1.4-rc.2/syncthing-linux-386-v2.1.4-rc.2.tar.gz'; sha256='7385c60be3a7cf7ffa033f750d675a7df45c6f547f6ac8ec858b5a53f608aacb' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v2.1.4-rc.2/syncthing-linux-amd64-v2.1.4-rc.2.tar.gz'; sha256='5723d4633648465ed6ab93fa632ca041088595a0bf1032c8261e9c0a0d5f6ea6' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v2.1.4-rc.2/syncthing-linux-arm-v2.1.4-rc.2.tar.gz'; sha256='fe0b433f630c19de2d622844f6ca87de45d752ac026f1d654c3b17c91144ee22' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v2.1.4-rc.2/syncthing-linux-arm-v2.1.4-rc.2.tar.gz'; sha256='fe0b433f630c19de2d622844f6ca87de45d752ac026f1d654c3b17c91144ee22' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v2.1.4-rc.2/syncthing-linux-arm64-v2.1.4-rc.2.tar.gz'; sha256='7ccc26c04885e7df4bc0d2d0259ed9e415ea7418296d4eafadbc45d09185dff7' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v2.1.4-rc.2/syncthing-linux-ppc64le-v2.1.4-rc.2.tar.gz'; sha256='93e966a26c3dd9c68d3c1a56721555caff033c17fec4d6bfbcc46480a54ea327' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v2.1.4-rc.2/syncthing-linux-riscv64-v2.1.4-rc.2.tar.gz'; sha256='e2ee01b63ac7ff78d74524ea401eee372ebf593ed916fd7d31fa5e75875c6b60' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v2.1.4-rc.2/syncthing-linux-s390x-v2.1.4-rc.2.tar.gz'; sha256='e2adc17307f233524325933e916faee33a869db5c871dec60a13c1470929c990' ;; \
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
