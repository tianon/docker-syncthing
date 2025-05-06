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
ENV SYNCTHING_VERSION 2.0.0-rc.14

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.14/syncthing-linux-386-v2.0.0-rc.14.tar.gz'; sha256='5362ad5dd62678c934d6f0adf1b576f0eaf34afbd39bd8f53823b3c4e8ac86b8' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.14/syncthing-linux-amd64-v2.0.0-rc.14.tar.gz'; sha256='8e7922d973064f7bd5a6c03f2168f570119557751ef9f2eba0c7e4f54d2844aa' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.14/syncthing-linux-arm-v2.0.0-rc.14.tar.gz'; sha256='68e149f97b28f07d9d9ee0962098c4f811c6ca6d39c79064ba5d97ebe9077c62' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.14/syncthing-linux-arm-v2.0.0-rc.14.tar.gz'; sha256='68e149f97b28f07d9d9ee0962098c4f811c6ca6d39c79064ba5d97ebe9077c62' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.14/syncthing-linux-arm64-v2.0.0-rc.14.tar.gz'; sha256='17baaabc7896787876a2476d178ebdc77c9fce8594e2d6b621458da239ee4b80' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.14/syncthing-linux-ppc64le-v2.0.0-rc.14.tar.gz'; sha256='316695a1f5dd021fd9e8cfb60c82ea9fbfd38266e74abaf973409aeb6c56a7ce' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.14/syncthing-linux-riscv64-v2.0.0-rc.14.tar.gz'; sha256='183bf22ec0f2038e7dc6b9f096d3255068d9d27f2119e02f5c9d186afbb30a8a' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.14/syncthing-linux-s390x-v2.0.0-rc.14.tar.gz'; sha256='3a0726b55298e4890db25bd6db92e24b34ebc14be5d5e86aff96c592406d394c' ;; \
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
