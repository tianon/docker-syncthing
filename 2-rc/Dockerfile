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
ENV SYNCTHING_VERSION 2.1.4-rc.1

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v2.1.4-rc.1/syncthing-linux-386-v2.1.4-rc.1.tar.gz'; sha256='26543cd381491b9ded0fa51386bd05984c9f69a524bfd567a56110c9f906ff05' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v2.1.4-rc.1/syncthing-linux-amd64-v2.1.4-rc.1.tar.gz'; sha256='521af7819b9e85b5b9749082175c10e08ead99d8202cc240a21d9cf0ea585fbe' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v2.1.4-rc.1/syncthing-linux-arm-v2.1.4-rc.1.tar.gz'; sha256='3e1047b84976cc835634df2d0ffce201c4ea5c58a88e482cd931c7488ba7e634' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v2.1.4-rc.1/syncthing-linux-arm-v2.1.4-rc.1.tar.gz'; sha256='3e1047b84976cc835634df2d0ffce201c4ea5c58a88e482cd931c7488ba7e634' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v2.1.4-rc.1/syncthing-linux-arm64-v2.1.4-rc.1.tar.gz'; sha256='7df0505020557ccb1f65a7ad4b9f481ebb71d7346ca8a80878faae453d589455' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v2.1.4-rc.1/syncthing-linux-ppc64le-v2.1.4-rc.1.tar.gz'; sha256='dd529918b8e2147ea89a5843c59c3bbeaf26694d34f0fda9614f75124ce7907d' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v2.1.4-rc.1/syncthing-linux-riscv64-v2.1.4-rc.1.tar.gz'; sha256='559db999098b33bcf9af8ddef7f6eb8abc6c5afdbb86ed18636265e1bc42178f' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v2.1.4-rc.1/syncthing-linux-s390x-v2.1.4-rc.1.tar.gz'; sha256='7f5207c7e88c5795c17f21019c9f2f23d6e136844f18feb4ee7f7106a386d22b' ;; \
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
