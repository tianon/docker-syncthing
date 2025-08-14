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
ENV SYNCTHING_VERSION 2.0.1

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v2.0.1/syncthing-linux-386-v2.0.1.tar.gz'; sha256='c5a4e1e5aada435504fcd10617bfdfbbd27126f2b8cd17617119a2ed09567798' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.1/syncthing-linux-amd64-v2.0.1.tar.gz'; sha256='9faef4cee847f9d7c9fc8c642a6fd77f758914e959b730413fb116efd1d05c54' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v2.0.1/syncthing-linux-arm-v2.0.1.tar.gz'; sha256='a3ee9ca20a39017fe9bdbf18481092af7aab3cedbf56015b4133e08581081166' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v2.0.1/syncthing-linux-arm-v2.0.1.tar.gz'; sha256='a3ee9ca20a39017fe9bdbf18481092af7aab3cedbf56015b4133e08581081166' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.1/syncthing-linux-arm64-v2.0.1.tar.gz'; sha256='1f5d2a462b43230c59b6ee94af2a776276f2a811c25b9691eee9890824588d00' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v2.0.1/syncthing-linux-ppc64le-v2.0.1.tar.gz'; sha256='ff76124ab8dfece53f8de55b6990fd92bd6a30ba11b11de5c90d61abb9585ddc' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.1/syncthing-linux-riscv64-v2.0.1.tar.gz'; sha256='cff1acd034c5011039274ba68d9240354c05e5b00a7cfa93ed71742b91c9eb49' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v2.0.1/syncthing-linux-s390x-v2.0.1.tar.gz'; sha256='0cee7e63fafa7d2fe7561b2c4b474b0a430c8f5e1160fa8bee6f3533bc73b93c' ;; \
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
