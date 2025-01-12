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
ENV SYNCTHING_VERSION 1.29.2

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v1.29.2/syncthing-linux-386-v1.29.2.tar.gz'; sha256='7498e2102fd939e649ac271eb57163a4ff65b0d0ede747f66dd37ab69f389b44' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v1.29.2/syncthing-linux-amd64-v1.29.2.tar.gz'; sha256='8413aa2929ff00f50fe94e396f4eb2568e9e615b8e8bdabad662051bc871fe4e' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v1.29.2/syncthing-linux-arm-v1.29.2.tar.gz'; sha256='b6634a1ec5c15dcc24e19680c73960040eb85192c00a0ba5c9470084a45bb225' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v1.29.2/syncthing-linux-arm-v1.29.2.tar.gz'; sha256='b6634a1ec5c15dcc24e19680c73960040eb85192c00a0ba5c9470084a45bb225' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v1.29.2/syncthing-linux-arm64-v1.29.2.tar.gz'; sha256='6cf4b15f3064aa3aa3dbaa72fffaa3d3ef0b7b98ad5a3a7c14ebdb013136a0d2' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v1.29.2/syncthing-linux-ppc64le-v1.29.2.tar.gz'; sha256='75877ebce81bd990aea25140694481319fbda7310544b0e0e043d1bbdc1e08f7' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v1.29.2/syncthing-linux-riscv64-v1.29.2.tar.gz'; sha256='b86104c01a4518a7929c361f852ef98ee99f78e36b6779713669e5a92bcc1767' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v1.29.2/syncthing-linux-s390x-v1.29.2.tar.gz'; sha256='4e097a3281fb334f0237df14c4618ea389f5f11c581e3fa5fee59da920398450' ;; \
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
