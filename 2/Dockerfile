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
ENV SYNCTHING_VERSION 2.1.7

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v2.1.7/syncthing-linux-386-v2.1.7.tar.gz'; sha256='3cbee24e509011d19859a2147f641b6cfff6e63e23ad3c30a410ea79f9322bac' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v2.1.7/syncthing-linux-amd64-v2.1.7.tar.gz'; sha256='2edc416e7ed136b7c858ed5f3f02a3b8316589605e54c380228ceea7acbf0142' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v2.1.7/syncthing-linux-arm-v2.1.7.tar.gz'; sha256='d8b59029e25992bc0d280fccc5626e5dca743b285fca1a36db1148fcf871b639' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v2.1.7/syncthing-linux-arm-v2.1.7.tar.gz'; sha256='d8b59029e25992bc0d280fccc5626e5dca743b285fca1a36db1148fcf871b639' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v2.1.7/syncthing-linux-arm64-v2.1.7.tar.gz'; sha256='48e456690cd2b97e7d26b02b5ac35f62a3b36172267b144cfeaf02c993ab955c' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v2.1.7/syncthing-linux-ppc64le-v2.1.7.tar.gz'; sha256='6e18fa230ef99d3d789cd06b15c7db55b9c5af14fd48d5cb6e59fe8de01402ed' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v2.1.7/syncthing-linux-riscv64-v2.1.7.tar.gz'; sha256='ea710ba8bc286f293b362e8fb37697a36877c9d29b8ca6ec1c05444d631a937b' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v2.1.7/syncthing-linux-s390x-v2.1.7.tar.gz'; sha256='dc8f22801a74235ee57f979dc05687b3114e8226824311bc03e27829b8efe538' ;; \
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
