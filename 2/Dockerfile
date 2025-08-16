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
ENV SYNCTHING_VERSION 2.0.2

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v2.0.2/syncthing-linux-386-v2.0.2.tar.gz'; sha256='62fc3475c287a008c3a93c2d48afb1751e38a1aa5becbffdb4b9af53f805c6f4' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.2/syncthing-linux-amd64-v2.0.2.tar.gz'; sha256='db40ed92ab436d9634b4722bf1fa5f3112961c16dc03a256a47f5f621a514f8d' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v2.0.2/syncthing-linux-arm-v2.0.2.tar.gz'; sha256='d60f75e2de402e84c6b1a7b1de3c44b9002ef24b45bf5586b35f3e3dbd288f3e' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v2.0.2/syncthing-linux-arm-v2.0.2.tar.gz'; sha256='d60f75e2de402e84c6b1a7b1de3c44b9002ef24b45bf5586b35f3e3dbd288f3e' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.2/syncthing-linux-arm64-v2.0.2.tar.gz'; sha256='f39727522af80c92866f596a0b2d68962fd3165cb4e92a603d094812912b6d0c' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v2.0.2/syncthing-linux-ppc64le-v2.0.2.tar.gz'; sha256='882ddf941fba23e39005b14b4cd9f94133cfec68c6e8a4911d9d0e7eecb945eb' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.2/syncthing-linux-riscv64-v2.0.2.tar.gz'; sha256='0a4e206cacc52fa860a3610c67522d72dc53446e78245cbd0aff08bef12072eb' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v2.0.2/syncthing-linux-s390x-v2.0.2.tar.gz'; sha256='3e40fbcd9f342c48f588c42e3f160cae63597be23b9f3bbcc61c1065fa113d2a' ;; \
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
