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
ENV SYNCTHING_VERSION 1.28.1-rc.2

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v1.28.1-rc.2/syncthing-linux-386-v1.28.1-rc.2.tar.gz'; sha256='bf93a78a9b105ada48f9cf9295f3272aa7b7f26a6f1e4bdeccc45225c221e466' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v1.28.1-rc.2/syncthing-linux-amd64-v1.28.1-rc.2.tar.gz'; sha256='039d328cbcd90b029c25112b4c143f5f54ca3df92680b9ee1b689337499ec3df' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v1.28.1-rc.2/syncthing-linux-arm-v1.28.1-rc.2.tar.gz'; sha256='e99fed0d227b51f1db869a6a2c66abca405ceb86ee2b4f2cb4a2db8a56d4025b' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v1.28.1-rc.2/syncthing-linux-arm-v1.28.1-rc.2.tar.gz'; sha256='e99fed0d227b51f1db869a6a2c66abca405ceb86ee2b4f2cb4a2db8a56d4025b' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v1.28.1-rc.2/syncthing-linux-arm64-v1.28.1-rc.2.tar.gz'; sha256='281bbd6deb131f6eb61b16f85339b8571049333ed7e3843db9c595f10a89b7c6' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v1.28.1-rc.2/syncthing-linux-ppc64le-v1.28.1-rc.2.tar.gz'; sha256='d608fda1565c1cb4716d4f01b97ad4c497be55eee660913adee442cf4d1f3383' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v1.28.1-rc.2/syncthing-linux-riscv64-v1.28.1-rc.2.tar.gz'; sha256='ef14b3f524da56fba2e0e5a2d8ab564f7759177e9e5c50ee79d773605ec794cf' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v1.28.1-rc.2/syncthing-linux-s390x-v1.28.1-rc.2.tar.gz'; sha256='ce0225e8613835759d5bf5c21f35611d8842d2a5bd649a07960572ec92b4ef6b' ;; \
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
