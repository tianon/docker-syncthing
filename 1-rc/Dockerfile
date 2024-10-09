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
ENV SYNCTHING_VERSION 1.28.0-rc.3

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v1.28.0-rc.3/syncthing-linux-386-v1.28.0-rc.3.tar.gz'; sha256='ebc4cb24029cb450acecc0560fc010e503eeb4b9c913132badd1aade40e55943' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v1.28.0-rc.3/syncthing-linux-amd64-v1.28.0-rc.3.tar.gz'; sha256='8d88224a6c4143e2304a2348d40db06600efe18e65574b06d9db749891eae0eb' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v1.28.0-rc.3/syncthing-linux-arm-v1.28.0-rc.3.tar.gz'; sha256='6d49477ec509fa83edd69d235ae4909e5a9e101ab5e0645066b0c7534eae057a' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v1.28.0-rc.3/syncthing-linux-arm-v1.28.0-rc.3.tar.gz'; sha256='6d49477ec509fa83edd69d235ae4909e5a9e101ab5e0645066b0c7534eae057a' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v1.28.0-rc.3/syncthing-linux-arm64-v1.28.0-rc.3.tar.gz'; sha256='2f9e2ecc1c8276a4223db9e1926df643281771c77fa81e1a0cc3ee7bd8e04159' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v1.28.0-rc.3/syncthing-linux-ppc64le-v1.28.0-rc.3.tar.gz'; sha256='82996d2900a69c4c3d3a337076a292ed0d3e429c8d3a871bf05684f3d276c673' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v1.28.0-rc.3/syncthing-linux-riscv64-v1.28.0-rc.3.tar.gz'; sha256='050ddcce9140ec7103694f1fcfff3d4f84a87f9d6334c3ccec6267f54933de34' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v1.28.0-rc.3/syncthing-linux-s390x-v1.28.0-rc.3.tar.gz'; sha256='eb158eeb4ec99589335b51dbe5a0a0b7874b1fe36a4dc5c1de7a1144a975eecf' ;; \
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
