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
ENV SYNCTHING_VERSION 2.0.15

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v2.0.15/syncthing-linux-386-v2.0.15.tar.gz'; sha256='df38759d4179760600885877915316c6c02a2ccb66e251460c80ae81c10c7c33' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.15/syncthing-linux-amd64-v2.0.15.tar.gz'; sha256='2a530687901ce8151c32ee0ff23a5282644ae9f1bf5cd5ee020983008586f4fc' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v2.0.15/syncthing-linux-arm-v2.0.15.tar.gz'; sha256='c2e3dfe735a9a665c63fd397955648a9e178f74de0ae89b5e0c95ac8b7f62c10' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v2.0.15/syncthing-linux-arm-v2.0.15.tar.gz'; sha256='c2e3dfe735a9a665c63fd397955648a9e178f74de0ae89b5e0c95ac8b7f62c10' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.15/syncthing-linux-arm64-v2.0.15.tar.gz'; sha256='93bc488b8a5e033566c536c77f134732d263e1e9ebd71dc7b4279fa9f211a72f' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v2.0.15/syncthing-linux-ppc64le-v2.0.15.tar.gz'; sha256='d2c706d495e6aa3d07bd988c1b11e67bbf6ae6e129c214b60a6575bc62e475a4' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.15/syncthing-linux-riscv64-v2.0.15.tar.gz'; sha256='e17b287141981094b4aaa2389aa15476600cc6ec449d2e2cc9826218bc174bf8' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v2.0.15/syncthing-linux-s390x-v2.0.15.tar.gz'; sha256='0a959637e4ba938ea99f5d5ab4de9f46604edb3dcc4632139135ab050c06bc5a' ;; \
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
