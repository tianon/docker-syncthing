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
ENV SYNCTHING_VERSION 1.27.0

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v1.27.0/syncthing-linux-386-v1.27.0.tar.gz'; sha256='835f4fbcd499a49c235164f3f98c9887b78f5566465389ce1d607695b693b739' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.0/syncthing-linux-amd64-v1.27.0.tar.gz'; sha256='5173233bf9404cbd00091359e019a46b3d6c77eeff35b6119b4824a69917aee5' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v1.27.0/syncthing-linux-arm-v1.27.0.tar.gz'; sha256='0b04f1eaabeb5cfddbfae81cd1e73194a805f2115cb5e917143ee43a1632c3f4' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v1.27.0/syncthing-linux-arm-v1.27.0.tar.gz'; sha256='0b04f1eaabeb5cfddbfae81cd1e73194a805f2115cb5e917143ee43a1632c3f4' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.0/syncthing-linux-arm64-v1.27.0.tar.gz'; sha256='d44a3a8f6d9982a082756223b533daaed19cbb6e4448210738c47aa7e55a515b' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v1.27.0/syncthing-linux-ppc64le-v1.27.0.tar.gz'; sha256='2069882623d0a2ad1d8ccfcd98c5194158f8096a9281b9021ddde4a7bad5a0a0' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.0/syncthing-linux-riscv64-v1.27.0.tar.gz'; sha256='3f3c2009ffef6f108c00339c59fb483b0e9ec5b68a148366b9320f383c8e72fa' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v1.27.0/syncthing-linux-s390x-v1.27.0.tar.gz'; sha256='99f252f6aa3ff99bb25e500674a9ccab906e3f720590882dfc6dad8c836d579b' ;; \
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
