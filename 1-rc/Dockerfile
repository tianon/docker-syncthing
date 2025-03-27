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
ENV SYNCTHING_VERSION 1.29.4-rc.2

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v1.29.4-rc.2/syncthing-linux-386-v1.29.4-rc.2.tar.gz'; sha256='01c9cfd1acf74525d6e29eef1133b06a5045df783be443103f89d59fe5e38e1b' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v1.29.4-rc.2/syncthing-linux-amd64-v1.29.4-rc.2.tar.gz'; sha256='7e90fa1032b20fce527434f57171c0bccb579a371439dc208951a863e776775f' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v1.29.4-rc.2/syncthing-linux-arm-v1.29.4-rc.2.tar.gz'; sha256='ff5d3f8fd9bf436bed50d15fd6f1983f712efca5f9a5c17dbb7d8413fe28fd7a' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v1.29.4-rc.2/syncthing-linux-arm-v1.29.4-rc.2.tar.gz'; sha256='ff5d3f8fd9bf436bed50d15fd6f1983f712efca5f9a5c17dbb7d8413fe28fd7a' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v1.29.4-rc.2/syncthing-linux-arm64-v1.29.4-rc.2.tar.gz'; sha256='e7744532159fa64cd62bb2168458dda0d6f41a4fce56fb08790f15388e318486' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v1.29.4-rc.2/syncthing-linux-ppc64le-v1.29.4-rc.2.tar.gz'; sha256='cc8541a5f63dc8c575756d3332e9bda1d8244256a75728711433428c0a4ffe6a' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v1.29.4-rc.2/syncthing-linux-riscv64-v1.29.4-rc.2.tar.gz'; sha256='21e3a9e883303c8b287d98312f36e82f20e77405e57c97bee821d34220bacbe7' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v1.29.4-rc.2/syncthing-linux-s390x-v1.29.4-rc.2.tar.gz'; sha256='2cd2d9d7be015b1a0e0eba070c1490c16c56019b16d17012f4d2e294153ae360' ;; \
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
