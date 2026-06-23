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
ENV SYNCTHING_VERSION 2.1.2-rc.3

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v2.1.2-rc.3/syncthing-linux-386-v2.1.2-rc.3.tar.gz'; sha256='65e03e4a7a59aec077a3f3b3eebbc3a85198cb214e09bd46dff09000db3fce2e' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v2.1.2-rc.3/syncthing-linux-amd64-v2.1.2-rc.3.tar.gz'; sha256='66caff0531d5ec8c4b60ef4554fc0e792ec43cdba8deca9d0a0e334c054ab111' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v2.1.2-rc.3/syncthing-linux-arm-v2.1.2-rc.3.tar.gz'; sha256='5114ceeb050e6624146dc567145056c4cd637b1b4de200e2ea8cd12c0b848e75' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v2.1.2-rc.3/syncthing-linux-arm-v2.1.2-rc.3.tar.gz'; sha256='5114ceeb050e6624146dc567145056c4cd637b1b4de200e2ea8cd12c0b848e75' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v2.1.2-rc.3/syncthing-linux-arm64-v2.1.2-rc.3.tar.gz'; sha256='a95cea8b41754e2f23e0639596e7ad7d1a67e099423f8d84a3e2522fd92d808a' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v2.1.2-rc.3/syncthing-linux-ppc64le-v2.1.2-rc.3.tar.gz'; sha256='f66779ec143b510ddf388543d276b47842d2ba7d4db1f7e3a5687e52c3b2831e' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v2.1.2-rc.3/syncthing-linux-riscv64-v2.1.2-rc.3.tar.gz'; sha256='0ec966bd52df360c86312f9361be0478daeb3b461ca52723fee3cb3a870252e3' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v2.1.2-rc.3/syncthing-linux-s390x-v2.1.2-rc.3.tar.gz'; sha256='fe80db7e122dff3c7b5b9f47071cbf07d587c1bbd7e4dca907061056c019fed9' ;; \
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
