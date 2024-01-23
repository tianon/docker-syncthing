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
ENV SYNCTHING_VERSION 1.27.3-rc.2

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v1.27.3-rc.2/syncthing-linux-386-v1.27.3-rc.2.tar.gz'; sha256='628a5040e017a954cc1f120d33fd1d999e6f2f9bbfab37a14095ab2d3b5490e1' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.3-rc.2/syncthing-linux-amd64-v1.27.3-rc.2.tar.gz'; sha256='da6c299dc472851be1c451265090d0d92b811faff7f2fc111d563da7177d6618' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v1.27.3-rc.2/syncthing-linux-arm-v1.27.3-rc.2.tar.gz'; sha256='0c759b63797f200f7a0edc63eb3505eb76e1f1746196e4f6c20f3d1842787f86' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v1.27.3-rc.2/syncthing-linux-arm-v1.27.3-rc.2.tar.gz'; sha256='0c759b63797f200f7a0edc63eb3505eb76e1f1746196e4f6c20f3d1842787f86' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.3-rc.2/syncthing-linux-arm64-v1.27.3-rc.2.tar.gz'; sha256='382523b4fcae7dce3eb3faa59ad5db4aba6eea9f11a967cb308dd2d892c76a1f' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v1.27.3-rc.2/syncthing-linux-ppc64le-v1.27.3-rc.2.tar.gz'; sha256='20b367ad4b1cd2f486e2e4077b0288c63195d0f916b53ab96371c0c270efd9a5' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.3-rc.2/syncthing-linux-riscv64-v1.27.3-rc.2.tar.gz'; sha256='1cf191806eae24f607e23ab231f38c8beba8cbfc4b67f60504fc59fe70c85bb0' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v1.27.3-rc.2/syncthing-linux-s390x-v1.27.3-rc.2.tar.gz'; sha256='597636bffb6b1d1b4dee36f3bca6eca7a35b18e60fb870449670ece50e86dc8c' ;; \
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
