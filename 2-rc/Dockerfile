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
ENV SYNCTHING_VERSION 2.0.0-rc.23

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.23/syncthing-linux-386-v2.0.0-rc.23.tar.gz'; sha256='37b7618d0d8cb4e522d833afc31ad4967412cc893eb24d917091941a1988eac6' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.23/syncthing-linux-amd64-v2.0.0-rc.23.tar.gz'; sha256='0b0a53697e345cec70311a9a5caafd4a0a4e03fc3fa6f1c22e8f64b20a173621' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.23/syncthing-linux-arm-v2.0.0-rc.23.tar.gz'; sha256='d030c7c4a970dbacd1bc78a9bfd2269abf6e6bba98e0572cbc7a8e0493b021d1' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.23/syncthing-linux-arm-v2.0.0-rc.23.tar.gz'; sha256='d030c7c4a970dbacd1bc78a9bfd2269abf6e6bba98e0572cbc7a8e0493b021d1' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.23/syncthing-linux-arm64-v2.0.0-rc.23.tar.gz'; sha256='01e95af78a24cb539f5c266ca3f05a00fa0e872ef435da000479b731c791cac5' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.23/syncthing-linux-ppc64le-v2.0.0-rc.23.tar.gz'; sha256='923690bb37b9cd50295e9c70d00d37588756c3e5f18896395644c7f5fc0035e8' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.23/syncthing-linux-riscv64-v2.0.0-rc.23.tar.gz'; sha256='503e0ac48486c9acd1d26a721675218ef9e73073707a19712aa77b0f575b74f5' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.23/syncthing-linux-s390x-v2.0.0-rc.23.tar.gz'; sha256='2a7a073544106315820339e8cedbf7bb8f93790d3c2028d87b9f04937f5f9869' ;; \
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
