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
ENV SYNCTHING_VERSION 1.27.6-rc.2

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v1.27.6-rc.2/syncthing-linux-386-v1.27.6-rc.2.tar.gz'; sha256='6b3d583dab303a2560d0675faafac43ed460f183544d7de8f8aa270c73a2f562' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.6-rc.2/syncthing-linux-amd64-v1.27.6-rc.2.tar.gz'; sha256='bc007e0e77c500045fd0f0ff4ed3f9b302d028b70a0bba2e5be2149d85be5683' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v1.27.6-rc.2/syncthing-linux-arm-v1.27.6-rc.2.tar.gz'; sha256='cedcdf46f981b5f6e5ec6dabf619b6515b18064649d536d357f63ed353bbb861' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v1.27.6-rc.2/syncthing-linux-arm-v1.27.6-rc.2.tar.gz'; sha256='cedcdf46f981b5f6e5ec6dabf619b6515b18064649d536d357f63ed353bbb861' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.6-rc.2/syncthing-linux-arm64-v1.27.6-rc.2.tar.gz'; sha256='21dd6534da3561cfdc5afef1b0daebef6c508e2e26552d038fa129e9bd61e904' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v1.27.6-rc.2/syncthing-linux-ppc64le-v1.27.6-rc.2.tar.gz'; sha256='d09ee5e8b7230629d75d1330c4e3aa15f6cf1bcb44526dad711943d6a3b866fc' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.6-rc.2/syncthing-linux-riscv64-v1.27.6-rc.2.tar.gz'; sha256='6a5f5423b2f20bbd7117961be50d1133b38d6554837b50c6fecfa03ec29a83b2' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v1.27.6-rc.2/syncthing-linux-s390x-v1.27.6-rc.2.tar.gz'; sha256='6fa775ac0dd3d2448f9b74a2fad86804abcb84c11907ddfc25ea0f647fd2a1ea' ;; \
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
