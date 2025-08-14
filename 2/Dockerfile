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
ENV SYNCTHING_VERSION 2.0.0

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0/syncthing-linux-386-v2.0.0.tar.gz'; sha256='1a1a8c5b7ddcb5ac7664c8fae6700fec5a20febb352520e769ac030364660ca6' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0/syncthing-linux-amd64-v2.0.0.tar.gz'; sha256='a30a4e92724607cb3f4efd9569a21c520eab16e8a3e7de4ce0fef49487f24640' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0/syncthing-linux-arm-v2.0.0.tar.gz'; sha256='09c7acec8a179377f3a052f6c1b31acf6f4504194d0bf9cb2688df92f4624364' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0/syncthing-linux-arm-v2.0.0.tar.gz'; sha256='09c7acec8a179377f3a052f6c1b31acf6f4504194d0bf9cb2688df92f4624364' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0/syncthing-linux-arm64-v2.0.0.tar.gz'; sha256='039d001f2e178ff1495d6495e1ee16582ff1fcc27c016fed5272d19be8fe626d' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0/syncthing-linux-ppc64le-v2.0.0.tar.gz'; sha256='77001975a9ce5860cc69a3556dd18923dc80fe7943362c94746f52f21e2b5bf0' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0/syncthing-linux-riscv64-v2.0.0.tar.gz'; sha256='7fa5dcb7ab8068a3fca569a93f90d4d2629420df20a1e001120e8184c433284d' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0/syncthing-linux-s390x-v2.0.0.tar.gz'; sha256='b62ea43fb6621586c03a073a62582a51ef027e427b2d832f261d69f48151fbe5' ;; \
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
