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
ENV SYNCTHING_VERSION 1.29.7-rc.1

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v1.29.7-rc.1/syncthing-linux-386-v1.29.7-rc.1.tar.gz'; sha256='c4ddf662c439bb74d7e1f3cafc4585af8e67cbaedf97f1ca7cd6ca34630f0189' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v1.29.7-rc.1/syncthing-linux-amd64-v1.29.7-rc.1.tar.gz'; sha256='0875b8dbc402826fc485c073421a86f7e9900d65b71d37d012e9f9b666925f09' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v1.29.7-rc.1/syncthing-linux-arm-v1.29.7-rc.1.tar.gz'; sha256='a7e87eaac5c0e01e66ec75c731baf8f8e3009e666e6a7df55477075e1c16ab9b' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v1.29.7-rc.1/syncthing-linux-arm-v1.29.7-rc.1.tar.gz'; sha256='a7e87eaac5c0e01e66ec75c731baf8f8e3009e666e6a7df55477075e1c16ab9b' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v1.29.7-rc.1/syncthing-linux-arm64-v1.29.7-rc.1.tar.gz'; sha256='20aa66d38afdc954a8f1b3b2bd9ed453e3d1ece52f8c5acd961eb2504e8effb6' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v1.29.7-rc.1/syncthing-linux-ppc64le-v1.29.7-rc.1.tar.gz'; sha256='60015289b1eb3cad5b98b027a744628e89f51433cc68b5ac51ef8fb3d52dafe5' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v1.29.7-rc.1/syncthing-linux-riscv64-v1.29.7-rc.1.tar.gz'; sha256='081cf40d84f0e959fc530a75275952aa05027f56eb31876063659ac664ccdc95' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v1.29.7-rc.1/syncthing-linux-s390x-v1.29.7-rc.1.tar.gz'; sha256='ecaf776a354b12d9da57b989e7c919052feb2bc1edf9461ef213f60267b95c86' ;; \
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
