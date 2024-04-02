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
ENV SYNCTHING_VERSION 1.27.5

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v1.27.5/syncthing-linux-386-v1.27.5.tar.gz'; sha256='b3705286aa294c80de53a59019ecb000bcb74be8cfeccc2db52b725e5cd39f90' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.5/syncthing-linux-amd64-v1.27.5.tar.gz'; sha256='cf2d26d683682e0e1b96a2633741972dec36d4934345bfbb2f0a7d6a01527aa4' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v1.27.5/syncthing-linux-arm-v1.27.5.tar.gz'; sha256='b747179dda280f289d9f30627c92d5efa561bdb7bc198b0d9040dc2f0f34b895' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v1.27.5/syncthing-linux-arm-v1.27.5.tar.gz'; sha256='b747179dda280f289d9f30627c92d5efa561bdb7bc198b0d9040dc2f0f34b895' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.5/syncthing-linux-arm64-v1.27.5.tar.gz'; sha256='80788c6d2a8806e2a68a2b24ed350cb8eb9dd5b445225582015b8e3b419da1bd' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v1.27.5/syncthing-linux-ppc64le-v1.27.5.tar.gz'; sha256='749108ce9bf15421d741ad2862279b8a17044abb920178351e6cfa44cc64aa91' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.5/syncthing-linux-riscv64-v1.27.5.tar.gz'; sha256='d30c7f7098a70341edef601ebac2cb3770511134c99b10a412d7e156f4341b1c' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v1.27.5/syncthing-linux-s390x-v1.27.5.tar.gz'; sha256='1f3884b7acdadbfe2b72a938a23750f71a3edac6e3b21754e48025e57231d1ec' ;; \
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
