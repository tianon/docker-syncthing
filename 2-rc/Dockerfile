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
ENV SYNCTHING_VERSION 2.0.0-beta.5

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-beta.5/syncthing-linux-386-v2.0.0-beta.5.tar.gz'; sha256='36d251987d3c6ab6ddba19290601dfecbe9c72e1fb8343f378eb7c661173c14c' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-beta.5/syncthing-linux-amd64-v2.0.0-beta.5.tar.gz'; sha256='dffacc21adc1dc90e054462bd74349cfbdcbbb42f41be0257e900d9e105afc59' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-beta.5/syncthing-linux-arm-v2.0.0-beta.5.tar.gz'; sha256='ae4f1c82eca2f2df7d007ea2888d3a3a49abde8a1b9178b65a6a07099b7df6e4' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-beta.5/syncthing-linux-arm-v2.0.0-beta.5.tar.gz'; sha256='ae4f1c82eca2f2df7d007ea2888d3a3a49abde8a1b9178b65a6a07099b7df6e4' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-beta.5/syncthing-linux-arm64-v2.0.0-beta.5.tar.gz'; sha256='d4e7532c50671a69e6fd5d615eaf74147b4ec0aad69934ffbd4c116be8e07ed7' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-beta.5/syncthing-linux-ppc64le-v2.0.0-beta.5.tar.gz'; sha256='6ba8b49f3a4519501a83868f7d2f4472d63b6b8db32444e8612666759bfa6e51' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-beta.5/syncthing-linux-riscv64-v2.0.0-beta.5.tar.gz'; sha256='f2af9ebfe5e84bdbb5c3c3b8dd903da1020a1db0d291596f40d15dedcdfd0355' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-beta.5/syncthing-linux-s390x-v2.0.0-beta.5.tar.gz'; sha256='10aa13cfa909eb3ba4c8e29b3c23dc19dbc90eaf265d340c51dac9aee34e13d8' ;; \
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
