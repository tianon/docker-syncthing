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
ENV SYNCTHING_VERSION 2.1.2

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v2.1.2/syncthing-linux-386-v2.1.2.tar.gz'; sha256='0a1ccca77bec371c648be3b1f702f28e0b060ddd9c2cca38f5e7f7a7c122c7eb' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v2.1.2/syncthing-linux-amd64-v2.1.2.tar.gz'; sha256='0cea24660ac7d8df19f01da979827b5c9463a8a60042e296829293cf80213ee4' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v2.1.2/syncthing-linux-arm-v2.1.2.tar.gz'; sha256='600f7d37f174825df55df619ef3e90a11f13ea4f4a5ca2a506461772ba9865e9' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v2.1.2/syncthing-linux-arm-v2.1.2.tar.gz'; sha256='600f7d37f174825df55df619ef3e90a11f13ea4f4a5ca2a506461772ba9865e9' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v2.1.2/syncthing-linux-arm64-v2.1.2.tar.gz'; sha256='2fcee9688f37df46337b0b78e7d2badc44549481e29eccaa8cdb1e698d79c8c5' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v2.1.2/syncthing-linux-ppc64le-v2.1.2.tar.gz'; sha256='789a6a41fccd76effd48621a05265e0832b4084dd721091e8f54990da2af8e8a' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v2.1.2/syncthing-linux-riscv64-v2.1.2.tar.gz'; sha256='cf86c14f905fc2bf13907e07e316b7d7caf929f5b70a2a189a95789eb3d202b1' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v2.1.2/syncthing-linux-s390x-v2.1.2.tar.gz'; sha256='96e1316cccc3982d94962b9801fdffd4778f4dc291dd33a39dce1bcf6de57b21' ;; \
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
