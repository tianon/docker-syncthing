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
ENV SYNCTHING_VERSION 2.0.9

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v2.0.9/syncthing-linux-386-v2.0.9.tar.gz'; sha256='0004c6b4126702064f4adbcb4eac66eb5c75eaba19f3702ef3ce5025c1c2878c' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.9/syncthing-linux-amd64-v2.0.9.tar.gz'; sha256='755ac045074cee707fc29915548d42bb9a58a444c61beb95f0d83f249cf9435b' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v2.0.9/syncthing-linux-arm-v2.0.9.tar.gz'; sha256='4816d4c9a6a063bed6be5db7aeaf6d52f838682fe2ba191a879ae5e985ff9c41' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v2.0.9/syncthing-linux-arm-v2.0.9.tar.gz'; sha256='4816d4c9a6a063bed6be5db7aeaf6d52f838682fe2ba191a879ae5e985ff9c41' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.9/syncthing-linux-arm64-v2.0.9.tar.gz'; sha256='41660299ad17f32367391367a7954df35f33017a5ad109a8a3323e15397411ff' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v2.0.9/syncthing-linux-ppc64le-v2.0.9.tar.gz'; sha256='24766b22733bc7907d29a92484619904d54720390d2bb3d2b2cb1e449fc5eb4e' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.9/syncthing-linux-riscv64-v2.0.9.tar.gz'; sha256='f60dfa200ee6d1bc31be780ecc782ef497b7c1e253a52dead9373abfc941de51' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v2.0.9/syncthing-linux-s390x-v2.0.9.tar.gz'; sha256='c8ba2c3d5fe5b51470b699ff1d95627d84ecf77f8c82dabbf512e0ab7d0616be' ;; \
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
