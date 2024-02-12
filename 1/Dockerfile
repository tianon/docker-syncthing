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
ENV SYNCTHING_VERSION 1.27.3

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v1.27.3/syncthing-linux-386-v1.27.3.tar.gz'; sha256='b1815f35faba2895217c5bfb1c99153c8dad801d9bd109f47df7ef2888b7c676' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.3/syncthing-linux-amd64-v1.27.3.tar.gz'; sha256='734ac805e74f780761cc4ab6e7b3b22aefd4589e9dadbdb55eeb0cf122aebfdb' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v1.27.3/syncthing-linux-arm-v1.27.3.tar.gz'; sha256='6c37db6329b995134aa5d589b0193e48712581a690b3197ef8141c77744644ac' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v1.27.3/syncthing-linux-arm-v1.27.3.tar.gz'; sha256='6c37db6329b995134aa5d589b0193e48712581a690b3197ef8141c77744644ac' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.3/syncthing-linux-arm64-v1.27.3.tar.gz'; sha256='d5c20e3fe3732a4560673ec037462978acafb67ed53c0e2d58eaa8b98b372b01' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v1.27.3/syncthing-linux-ppc64le-v1.27.3.tar.gz'; sha256='7a386cc20c2264cfed24388221708d7fd4bf3719661372adafbb8f1bf2fb12c6' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.3/syncthing-linux-riscv64-v1.27.3.tar.gz'; sha256='c357421747196b84cbcc2e6813ded8a6146f50dfa2d71c3dfde95a3b6f8df123' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v1.27.3/syncthing-linux-s390x-v1.27.3.tar.gz'; sha256='4a23765429569ffd731a7060ea00712b690d1924ac2df0cb00400a1d007ee1d6' ;; \
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
