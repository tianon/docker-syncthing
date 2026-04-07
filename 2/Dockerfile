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
ENV SYNCTHING_VERSION 2.0.16

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v2.0.16/syncthing-linux-386-v2.0.16.tar.gz'; sha256='407076caead4eec3c1ecacb5e3466958784220b5d646c83f5e178ee85d62b4a7' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.16/syncthing-linux-amd64-v2.0.16.tar.gz'; sha256='d5ca379993844b0e6e4fced05e3ac4a6c4513dee916ab65516c6d07d5e53e317' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v2.0.16/syncthing-linux-arm-v2.0.16.tar.gz'; sha256='93a52ffd06b1627810a229c1e26d242cbd267b3d1902ed918819a897f0724237' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v2.0.16/syncthing-linux-arm-v2.0.16.tar.gz'; sha256='93a52ffd06b1627810a229c1e26d242cbd267b3d1902ed918819a897f0724237' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.16/syncthing-linux-arm64-v2.0.16.tar.gz'; sha256='0254442af9be1886a7b55f63ad3c24c32fc2e294a3a2efd75a3b8b00335e5bd7' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v2.0.16/syncthing-linux-ppc64le-v2.0.16.tar.gz'; sha256='0762d74b2a4d1ea167956c393b3ea7e639699eee78446b085a63e412d7aabbc0' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.16/syncthing-linux-riscv64-v2.0.16.tar.gz'; sha256='6d53cb3870e78a1c27dc68e4fe401de072bbbe64b72b3ae39d761511c7bf252a' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v2.0.16/syncthing-linux-s390x-v2.0.16.tar.gz'; sha256='cb9a5efb1b07c22f14264cf47f785702f1aad7fb85499b633fc05987d8059bf7' ;; \
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
