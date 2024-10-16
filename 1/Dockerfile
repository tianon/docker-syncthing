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
ENV SYNCTHING_VERSION 1.28.0

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v1.28.0/syncthing-linux-386-v1.28.0.tar.gz'; sha256='2fc1e0e78208634a2700cac03edefadfc7494df3e3cd29b0a042134e55c90ca1' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v1.28.0/syncthing-linux-amd64-v1.28.0.tar.gz'; sha256='9bc818c8e85c5dd3add93d53bf3a6e340aac67d26ebcdb7460c14a4870f51fb6' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v1.28.0/syncthing-linux-arm-v1.28.0.tar.gz'; sha256='68fb80f289edeb39a027139a5dfce48cb9be495a892c0a7d309b7a65b20ea954' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v1.28.0/syncthing-linux-arm-v1.28.0.tar.gz'; sha256='68fb80f289edeb39a027139a5dfce48cb9be495a892c0a7d309b7a65b20ea954' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v1.28.0/syncthing-linux-arm64-v1.28.0.tar.gz'; sha256='db94c89bcd8fad8c6ecf2dde36c56635fcaecf1c8824d7e4206473dc718e9e26' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v1.28.0/syncthing-linux-ppc64le-v1.28.0.tar.gz'; sha256='00dba73401218e5e20cb9ee60dcf152d404f15c529ce4e8421ff1eb99edb97fb' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v1.28.0/syncthing-linux-riscv64-v1.28.0.tar.gz'; sha256='f5364c5fbbd865efa4b26c535317eeb7e099c4a0c43fe709b21bfe8b39ce8b65' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v1.28.0/syncthing-linux-s390x-v1.28.0.tar.gz'; sha256='61306aab84aeb0c7534c26abf684c7d4554d37fa5d71c51d1c810f89ca674853' ;; \
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
