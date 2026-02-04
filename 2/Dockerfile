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
ENV SYNCTHING_VERSION 2.0.14

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v2.0.14/syncthing-linux-386-v2.0.14.tar.gz'; sha256='80fe4e9b89391ec65cf9894ed1f095a9547a481d0a34ccc3a4df7fdb83b1d0df' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.14/syncthing-linux-amd64-v2.0.14.tar.gz'; sha256='3d4ddb286d57ad4619b59948dbe0ba4dbcdb6bca66bbcf6702d178a8637431aa' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v2.0.14/syncthing-linux-arm-v2.0.14.tar.gz'; sha256='29566cb634fe0d0d43346821180e3fad8c94c9292549fce9c5b4d706b562d85f' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v2.0.14/syncthing-linux-arm-v2.0.14.tar.gz'; sha256='29566cb634fe0d0d43346821180e3fad8c94c9292549fce9c5b4d706b562d85f' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.14/syncthing-linux-arm64-v2.0.14.tar.gz'; sha256='1825e1e0dd7813c83d2b8eeb6d17683394511056afd655752a0c2fb21f6ec29c' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v2.0.14/syncthing-linux-ppc64le-v2.0.14.tar.gz'; sha256='1501e3c7d3f2f6cf92b44ea2a4251ebd0d40d57c9da256d74ec0a82f1842b9bb' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.14/syncthing-linux-riscv64-v2.0.14.tar.gz'; sha256='4202e150cf2f10f935f6782e51b7665c9cd410d1a891d3429c9939c5bbe69dc0' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v2.0.14/syncthing-linux-s390x-v2.0.14.tar.gz'; sha256='c759865d7bdad808616069875bf21a953c68bf9e08dda80117b4f4e30b17c39e' ;; \
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
