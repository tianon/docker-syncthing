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
ENV SYNCTHING_VERSION 1.28.0-rc.1

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v1.28.0-rc.1/syncthing-linux-386-v1.28.0-rc.1.tar.gz'; sha256='88d4e07d71b9fe775ad75dba3a4c4014a987a1134d19af063e18432f78bf2784' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v1.28.0-rc.1/syncthing-linux-amd64-v1.28.0-rc.1.tar.gz'; sha256='64cec53d336d2f738939992bfff2eae317389ebd349747b7c877023e13367162' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v1.28.0-rc.1/syncthing-linux-arm-v1.28.0-rc.1.tar.gz'; sha256='ebb56e81d54da8133e78857e10854a364c04bfab7264baaf28cd9cd3bd7c0068' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v1.28.0-rc.1/syncthing-linux-arm-v1.28.0-rc.1.tar.gz'; sha256='ebb56e81d54da8133e78857e10854a364c04bfab7264baaf28cd9cd3bd7c0068' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v1.28.0-rc.1/syncthing-linux-arm64-v1.28.0-rc.1.tar.gz'; sha256='e0c6c22b2ff2ae0cf1842d8ca0f83db261cbf9d677df801d56a69ccd098801a8' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v1.28.0-rc.1/syncthing-linux-ppc64le-v1.28.0-rc.1.tar.gz'; sha256='2a0df2ac5b2231537306dc7fdf6bdcdf46252517c2d20855db5f107233c61413' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v1.28.0-rc.1/syncthing-linux-riscv64-v1.28.0-rc.1.tar.gz'; sha256='a7f1d6bb025730e36cb5d4dd97833ea80d6f51bddd6fdaea1d88bfa7917575a1' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v1.28.0-rc.1/syncthing-linux-s390x-v1.28.0-rc.1.tar.gz'; sha256='1c84551f97ae66f14cb24e2db0a36e54213a24c72306a4ad8110fc0529688e66' ;; \
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
