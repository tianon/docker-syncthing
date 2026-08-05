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
ENV SYNCTHING_VERSION 2.1.3

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v2.1.3/syncthing-linux-386-v2.1.3.tar.gz'; sha256='a6bbf3606c5cf934a50122b403c8c563c72d5e19173648a9cf091cd25c2b229d' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v2.1.3/syncthing-linux-amd64-v2.1.3.tar.gz'; sha256='f929eb8e5b72a85543eeeefb2c38f34a68e0c530e70758a2905b78840c76602c' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v2.1.3/syncthing-linux-arm-v2.1.3.tar.gz'; sha256='f840fa49a353d3c3d9bf64326ed15c028b44d93137572db74a480d625338cbc4' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v2.1.3/syncthing-linux-arm-v2.1.3.tar.gz'; sha256='f840fa49a353d3c3d9bf64326ed15c028b44d93137572db74a480d625338cbc4' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v2.1.3/syncthing-linux-arm64-v2.1.3.tar.gz'; sha256='a5c046965b590a8de2f8c8c16a0dbf9201d99600b0cafd604040232b603e4586' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v2.1.3/syncthing-linux-ppc64le-v2.1.3.tar.gz'; sha256='7c53e45ff341788d66af74c415ca44b37525ab5308c061543f3fabb5b3e69b42' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v2.1.3/syncthing-linux-riscv64-v2.1.3.tar.gz'; sha256='5334c05c95baf64f078e2975625e0e2e231362142ebb9c82f8abf0a1a26548a4' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v2.1.3/syncthing-linux-s390x-v2.1.3.tar.gz'; sha256='0de6f1e2fbc74276e65380c6ca32017dca779832daae3f1aaf744ab39f5252af' ;; \
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
