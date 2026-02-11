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
ENV SYNCTHING_VERSION 2.0.15-rc.1

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v2.0.15-rc.1/syncthing-linux-386-v2.0.15-rc.1.tar.gz'; sha256='0ad7de0e332c0b41a13943f9cab436743adb59261725303a21ffdb9b56cc1194' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.15-rc.1/syncthing-linux-amd64-v2.0.15-rc.1.tar.gz'; sha256='dbbfda7f8ff9bbfc4d6154f5fd9580f8971bab35d2eeb17285a94735a5fd18ee' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v2.0.15-rc.1/syncthing-linux-arm-v2.0.15-rc.1.tar.gz'; sha256='3ecb47f64dd8c2863120c0b9605fe1accbe192f9dc79ee4d9a31efe9a33bc790' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v2.0.15-rc.1/syncthing-linux-arm-v2.0.15-rc.1.tar.gz'; sha256='3ecb47f64dd8c2863120c0b9605fe1accbe192f9dc79ee4d9a31efe9a33bc790' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.15-rc.1/syncthing-linux-arm64-v2.0.15-rc.1.tar.gz'; sha256='9e690875edeacb228aeaeda89fddafcb4a262af345917c67adb14aae0673b706' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v2.0.15-rc.1/syncthing-linux-ppc64le-v2.0.15-rc.1.tar.gz'; sha256='dc045dbd1c8be376b8b5e822b4d54b2a684770f5f6aa31cbe809a6b49057ac52' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.15-rc.1/syncthing-linux-riscv64-v2.0.15-rc.1.tar.gz'; sha256='adbe995766cbcdc3eba70b817acaaa65b05206c509cd3baaad63c59b20345a0c' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v2.0.15-rc.1/syncthing-linux-s390x-v2.0.15-rc.1.tar.gz'; sha256='3024741fd2fab5e6d8049549c0653e1778968839a69ca65c552383715d88756f' ;; \
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
