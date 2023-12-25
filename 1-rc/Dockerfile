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
ENV SYNCTHING_VERSION 1.27.2-rc.2

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v1.27.2-rc.2/syncthing-linux-386-v1.27.2-rc.2.tar.gz'; sha256='6e9f8785b015f206f389953850efc7994f5424e1ad5c91f0c16f63c9cad1f209' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.2-rc.2/syncthing-linux-amd64-v1.27.2-rc.2.tar.gz'; sha256='4f38922e95f8eff48fd027b711a63b34a6b799107590a10be4a6971b49905a32' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v1.27.2-rc.2/syncthing-linux-arm-v1.27.2-rc.2.tar.gz'; sha256='b9c25583332a54854607ed202264d03333f922112492600135a400bfbb7ed103' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v1.27.2-rc.2/syncthing-linux-arm-v1.27.2-rc.2.tar.gz'; sha256='b9c25583332a54854607ed202264d03333f922112492600135a400bfbb7ed103' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.2-rc.2/syncthing-linux-arm64-v1.27.2-rc.2.tar.gz'; sha256='e6e687b56f2e94e2b41c2caa918166b2af9418bb56e54bb3ce2147a7882e0b10' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v1.27.2-rc.2/syncthing-linux-ppc64le-v1.27.2-rc.2.tar.gz'; sha256='486324c3b73e5b72048a41b932b878bc64ddc04609847033d4c65d6d2be0e087' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.2-rc.2/syncthing-linux-riscv64-v1.27.2-rc.2.tar.gz'; sha256='56a696995a41ddb64173142b3ca264f699f3a993e03c5fb740f2c5d7b0ba2a7a' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v1.27.2-rc.2/syncthing-linux-s390x-v1.27.2-rc.2.tar.gz'; sha256='caddc4384e21f5de97a8cbb6e1ca8131f378ec497d437291c361b4f72d044d4d' ;; \
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
