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
ENV SYNCTHING_VERSION 2.0.0-beta.10

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-beta.10/syncthing-linux-386-v2.0.0-beta.10.tar.gz'; sha256='6b80c475ca3de64be58a02380bab3165e701855ae94a41bc8b35f11a031a5bf8' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-beta.10/syncthing-linux-amd64-v2.0.0-beta.10.tar.gz'; sha256='634bd03bad2d89886099abfadc91028c13ee4604449180b6dedb31d7bd1a17fc' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-beta.10/syncthing-linux-arm-v2.0.0-beta.10.tar.gz'; sha256='1b011956b41289f4f1e8729dcc4e8f70a733604200c5842decb0c4af97ab7079' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-beta.10/syncthing-linux-arm-v2.0.0-beta.10.tar.gz'; sha256='1b011956b41289f4f1e8729dcc4e8f70a733604200c5842decb0c4af97ab7079' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-beta.10/syncthing-linux-arm64-v2.0.0-beta.10.tar.gz'; sha256='9b96b58f538382adb0f6fdc599a92871221b253f1608a29af5df4c58399597d4' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-beta.10/syncthing-linux-ppc64le-v2.0.0-beta.10.tar.gz'; sha256='95f0efa0a38205b444bc3dbf428ec5611405c34b1d5a121c021b9ba6bd02ea6a' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-beta.10/syncthing-linux-riscv64-v2.0.0-beta.10.tar.gz'; sha256='82db16df0c1dfa00d069dcbec15f0cebf79398a0d547d44fd32a4dba800d90d9' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-beta.10/syncthing-linux-s390x-v2.0.0-beta.10.tar.gz'; sha256='5dc58e65fdfedd568acf9b6a43a3c935914f1cb1c7e78a7dec2042350c7356e0' ;; \
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
