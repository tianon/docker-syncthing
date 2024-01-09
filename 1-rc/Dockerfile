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
ENV SYNCTHING_VERSION 1.27.3-rc.1

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v1.27.3-rc.1/syncthing-linux-386-v1.27.3-rc.1.tar.gz'; sha256='dfffa6446c0cbf008a1e1655100ac1b8e8a5b62b1c21bf76dadcdccd7815abff' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.3-rc.1/syncthing-linux-amd64-v1.27.3-rc.1.tar.gz'; sha256='17764d09d65a8469cece2023949da5298097b4b652b25178019391d3aae24e52' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v1.27.3-rc.1/syncthing-linux-arm-v1.27.3-rc.1.tar.gz'; sha256='e96050b5231a8675a8c7a1ce2bc52c1a4e66c2f084bfe90d62387e2ee6e1b416' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v1.27.3-rc.1/syncthing-linux-arm-v1.27.3-rc.1.tar.gz'; sha256='e96050b5231a8675a8c7a1ce2bc52c1a4e66c2f084bfe90d62387e2ee6e1b416' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.3-rc.1/syncthing-linux-arm64-v1.27.3-rc.1.tar.gz'; sha256='a202fbe99bb90cfde8b4f26fde280dfdfdafc12556ef6fd6922ff7c57992077c' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v1.27.3-rc.1/syncthing-linux-ppc64le-v1.27.3-rc.1.tar.gz'; sha256='931efa01cd570366f1f9510e1a5c3568a614ab0e74e83132fa599de04f3c54fb' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.3-rc.1/syncthing-linux-riscv64-v1.27.3-rc.1.tar.gz'; sha256='0938cdea690115cd913c7e760d22679c6ea355c910194e1e68e0b166ba311bc2' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v1.27.3-rc.1/syncthing-linux-s390x-v1.27.3-rc.1.tar.gz'; sha256='a85350b2143801b6a72a4d3241bf68a27825744508198c62eaeff1fae45e5cb8' ;; \
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
