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
ENV SYNCTHING_VERSION 2.0.0-rc.25

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.25/syncthing-linux-386-v2.0.0-rc.25.tar.gz'; sha256='24bacc4b1af605c16c519cf6091c067794f247b8b7c790f125f3e55988fbe6d8' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.25/syncthing-linux-amd64-v2.0.0-rc.25.tar.gz'; sha256='8b491b060b8bccf9dd9f3a540c63a030e5c191b765ac81614b67173004ff5db3' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.25/syncthing-linux-arm-v2.0.0-rc.25.tar.gz'; sha256='7fa1a1e6632baba372e0dfd95ba4c34fe1a94df163fc3171e86e13254c6c8e47' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.25/syncthing-linux-arm-v2.0.0-rc.25.tar.gz'; sha256='7fa1a1e6632baba372e0dfd95ba4c34fe1a94df163fc3171e86e13254c6c8e47' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.25/syncthing-linux-arm64-v2.0.0-rc.25.tar.gz'; sha256='93822abd6e81eb068dc3c940a654ea22a04778cc8d5ddb2bc3b299fa15219207' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.25/syncthing-linux-ppc64le-v2.0.0-rc.25.tar.gz'; sha256='fa96cf17573d3aaa8a338d0e11140daf79cb5f62c124d8bd6ed1346c355b5dc8' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.25/syncthing-linux-riscv64-v2.0.0-rc.25.tar.gz'; sha256='0e1dd25d5a33696ebb49cf810e3e946f92b4e643469eda291d56cdc4a429eb36' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.25/syncthing-linux-s390x-v2.0.0-rc.25.tar.gz'; sha256='e3be4ccb9f5030f0b85d496409f4f9f39e5527d07dd824492171a9a7b0dc7796' ;; \
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
