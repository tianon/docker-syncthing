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
ENV SYNCTHING_VERSION 2.0.4-rc.2

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v2.0.4-rc.2/syncthing-linux-386-v2.0.4-rc.2.tar.gz'; sha256='322fd039235008b611efdc96679fc819fe1728e27eb6ad7a4bb1b7c82c0fc68a' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.4-rc.2/syncthing-linux-amd64-v2.0.4-rc.2.tar.gz'; sha256='c2a760fdb8121b9435941c2cbdc6b9800c7015edc9d958e9bdd90dace47a5402' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v2.0.4-rc.2/syncthing-linux-arm-v2.0.4-rc.2.tar.gz'; sha256='04aabb72217634d8ce8906ce30a1310aaf4d0856f4cdb4cd8194bd19c6f3433f' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v2.0.4-rc.2/syncthing-linux-arm-v2.0.4-rc.2.tar.gz'; sha256='04aabb72217634d8ce8906ce30a1310aaf4d0856f4cdb4cd8194bd19c6f3433f' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.4-rc.2/syncthing-linux-arm64-v2.0.4-rc.2.tar.gz'; sha256='f512dc9416f7e8c3b18ec28fdba302b0a2b4cb81b55d7119ddceed17f064455f' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v2.0.4-rc.2/syncthing-linux-ppc64le-v2.0.4-rc.2.tar.gz'; sha256='d8732661de75b6640463cb654e0c62dca2218b2b91153c3d97720b468069d4c0' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.4-rc.2/syncthing-linux-riscv64-v2.0.4-rc.2.tar.gz'; sha256='c5022c9bc3880fa2805e3534ed4f8e523e7f2c21fd45e0f18429d5598e807a58' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v2.0.4-rc.2/syncthing-linux-s390x-v2.0.4-rc.2.tar.gz'; sha256='8ff7aa86c35ac2f5cf54ff1d9d3a1f3acaf5899400211e12875c780baec93647' ;; \
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
