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
ENV SYNCTHING_VERSION 1.27.2

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v1.27.2/syncthing-linux-386-v1.27.2.tar.gz'; sha256='4f09e64decf1c5aedbb2fcb3b246a6822d1e241febc7a34a454ffbd3d2e15fce' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.2/syncthing-linux-amd64-v1.27.2.tar.gz'; sha256='fe645be8bc2c5e5ce6f8f17bc2e43b1654a5ce8822b605248cac2a57028652f4' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v1.27.2/syncthing-linux-arm-v1.27.2.tar.gz'; sha256='8916cc958f671f51acd7824f848aa322bf19b2631a888ebb9766fba51c5a7b6d' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v1.27.2/syncthing-linux-arm-v1.27.2.tar.gz'; sha256='8916cc958f671f51acd7824f848aa322bf19b2631a888ebb9766fba51c5a7b6d' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.2/syncthing-linux-arm64-v1.27.2.tar.gz'; sha256='ef14a7cebd5532ee87b6e6d680f4a4d12c65155bcf59d55a3763a9d014163706' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v1.27.2/syncthing-linux-ppc64le-v1.27.2.tar.gz'; sha256='bd4e459ef3d57ab35e7b5a57d9d00de0aa2a1175ddd049eb88c6991657f85ee7' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.2/syncthing-linux-riscv64-v1.27.2.tar.gz'; sha256='6d4e3a85a0aaf2e1c96876e887816f310ab3eab47462c94f5f03dae1f5d5be81' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v1.27.2/syncthing-linux-s390x-v1.27.2.tar.gz'; sha256='7108824881b96e5ecf9a8dc59519a093c6be5a6f4b2928e4c4ca8650fd4f3159' ;; \
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
