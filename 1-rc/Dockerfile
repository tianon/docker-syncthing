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
ENV SYNCTHING_VERSION 1.27.8-rc.1

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v1.27.8-rc.1/syncthing-linux-386-v1.27.8-rc.1.tar.gz'; sha256='f6b93aebf5884775a9f67088e3b29ffd89f6ba62363f7a0a6950bdd60ed591bf' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.8-rc.1/syncthing-linux-amd64-v1.27.8-rc.1.tar.gz'; sha256='43482fb31c60fb584cb09462355697c0cc93df112b03f8d52cab0038e2bfae1a' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v1.27.8-rc.1/syncthing-linux-arm-v1.27.8-rc.1.tar.gz'; sha256='cb1f965cf461c49c72bd4baea38d105665d70c43207ef55f260c3f9fcf1d8989' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v1.27.8-rc.1/syncthing-linux-arm-v1.27.8-rc.1.tar.gz'; sha256='cb1f965cf461c49c72bd4baea38d105665d70c43207ef55f260c3f9fcf1d8989' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.8-rc.1/syncthing-linux-arm64-v1.27.8-rc.1.tar.gz'; sha256='3618189c19b6e8271b2f65ca59319cf822914bb27b38c21a444c9281ad0be7f1' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v1.27.8-rc.1/syncthing-linux-ppc64le-v1.27.8-rc.1.tar.gz'; sha256='d1113dd9fff1a33ed9ef06f221c4b37ef7dded609854d50cf3682b3ccbd56d5a' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.8-rc.1/syncthing-linux-riscv64-v1.27.8-rc.1.tar.gz'; sha256='20a42d1437dfe81006dd63896f87fbde7d6fd172a2702c43b2a7b5d1d6781e2a' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v1.27.8-rc.1/syncthing-linux-s390x-v1.27.8-rc.1.tar.gz'; sha256='62cb82d750f2518a09e5f7885905b6dd14b825501d46b5076b95565d62b37c9f' ;; \
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
