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
ENV SYNCTHING_VERSION 1.30.0-rc.1

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v1.30.0-rc.1/syncthing-linux-386-v1.30.0-rc.1.tar.gz'; sha256='7285afada902d3d69ea8f06105257c24ba82ca8f1abd52b971e8833b39337788' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v1.30.0-rc.1/syncthing-linux-amd64-v1.30.0-rc.1.tar.gz'; sha256='4bffdf2ec4b57d092a8d1855f95272d0b98f0ac94ab5288ebecb79da26983b98' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v1.30.0-rc.1/syncthing-linux-arm-v1.30.0-rc.1.tar.gz'; sha256='01354f2fda9d9b247095c32022307a4d185f6a74a22d3b060a7f790c0fc7a34d' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v1.30.0-rc.1/syncthing-linux-arm-v1.30.0-rc.1.tar.gz'; sha256='01354f2fda9d9b247095c32022307a4d185f6a74a22d3b060a7f790c0fc7a34d' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v1.30.0-rc.1/syncthing-linux-arm64-v1.30.0-rc.1.tar.gz'; sha256='f66681416d15cc58319b25ceecdb75af43e4e79b98befc9e2110fe16b8d5524a' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v1.30.0-rc.1/syncthing-linux-ppc64le-v1.30.0-rc.1.tar.gz'; sha256='95b6a990e95842712e18134f10fb3da0134ec735eabe57d7c293d6bc6b2e25d5' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v1.30.0-rc.1/syncthing-linux-riscv64-v1.30.0-rc.1.tar.gz'; sha256='8182c2c98500fce57ce1441c8b06cce3f4a367b2d4bbda0491a3f6cac72cd2e6' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v1.30.0-rc.1/syncthing-linux-s390x-v1.30.0-rc.1.tar.gz'; sha256='97647ab962721ed2f066c1ebb66630cefdb72e3154f77d951c97b13afde8dca3' ;; \
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
