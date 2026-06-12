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
ENV SYNCTHING_VERSION 2.1.2-rc.1

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v2.1.2-rc.1/syncthing-linux-386-v2.1.2-rc.1.tar.gz'; sha256='6204637a37ee22ea9d558cc55c5c3c875c6d5238a5976664fdf46e42be9f5ff7' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v2.1.2-rc.1/syncthing-linux-amd64-v2.1.2-rc.1.tar.gz'; sha256='77fdbb9ddb58660a4206c58925b18183c97db5716f495607f041d402c2fab724' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v2.1.2-rc.1/syncthing-linux-arm-v2.1.2-rc.1.tar.gz'; sha256='2705726dd702ea56d3d942a31705b1f1e26360feacc50a2d2eace4c7f5ae4e00' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v2.1.2-rc.1/syncthing-linux-arm-v2.1.2-rc.1.tar.gz'; sha256='2705726dd702ea56d3d942a31705b1f1e26360feacc50a2d2eace4c7f5ae4e00' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v2.1.2-rc.1/syncthing-linux-arm64-v2.1.2-rc.1.tar.gz'; sha256='3adaa6906b28649a0a1024a1d5dec9dbb01db363451f3c8d3f3e73be09e49798' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v2.1.2-rc.1/syncthing-linux-ppc64le-v2.1.2-rc.1.tar.gz'; sha256='f7f05749d9cacfe6abe621c27df24881b1ff04393e53d1b5dddf2c34ea729735' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v2.1.2-rc.1/syncthing-linux-riscv64-v2.1.2-rc.1.tar.gz'; sha256='0084c2493fa62978f9bcdae7132a9b39c67a6cae5f912da0cd0bb3ac99c6ca40' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v2.1.2-rc.1/syncthing-linux-s390x-v2.1.2-rc.1.tar.gz'; sha256='1667385a65c60862213e530cfc538194db6b93e7f7d145b17ecfd606efc6a380' ;; \
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
