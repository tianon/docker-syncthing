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
ENV SYNCTHING_VERSION 2.0.0-rc.19

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.19/syncthing-linux-386-v2.0.0-rc.19.tar.gz'; sha256='c65d085aa9238f7bca6ebb602f764acf6d6b6b3a7daca1b7d8babb08fc095ef4' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.19/syncthing-linux-amd64-v2.0.0-rc.19.tar.gz'; sha256='30b4096d6b8aaef8f976a07e62467cb6b428d1025c0cdaa8a50ff26512c2c9d2' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.19/syncthing-linux-arm-v2.0.0-rc.19.tar.gz'; sha256='74616aa66519e2e3f9789efa4c850cc8d8fe8db0cdd658ed6048af33afda421f' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.19/syncthing-linux-arm-v2.0.0-rc.19.tar.gz'; sha256='74616aa66519e2e3f9789efa4c850cc8d8fe8db0cdd658ed6048af33afda421f' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.19/syncthing-linux-arm64-v2.0.0-rc.19.tar.gz'; sha256='2f2dd6919e3834ca9f0af7f3de99adb3c69c8984fd6364f6fcda00eadf50f65b' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.19/syncthing-linux-ppc64le-v2.0.0-rc.19.tar.gz'; sha256='3ac85e5d005030d00190a609e733fd1599dc65feca5550e73ff4a40ff10f1167' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.19/syncthing-linux-riscv64-v2.0.0-rc.19.tar.gz'; sha256='2f4c64d9e2eeec90aaf174572a50d2be66d7285c98c9440ae76afb707a9bf4ed' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.19/syncthing-linux-s390x-v2.0.0-rc.19.tar.gz'; sha256='1a4d6bdc501d1f9db9d9f3ddec151c6769b080b9c6be0a456a6bb921ec801bd6' ;; \
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
