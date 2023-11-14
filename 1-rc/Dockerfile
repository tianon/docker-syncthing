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
ENV SYNCTHING_VERSION 1.27.0-rc.1

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v1.27.0-rc.1/syncthing-linux-386-v1.27.0-rc.1.tar.gz'; sha256='48a3fb0500369d4c8da14b4136ccb44c828462bc5a8df87a165228780df2d15b' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.0-rc.1/syncthing-linux-amd64-v1.27.0-rc.1.tar.gz'; sha256='999d40d76ccf2a888a6319328b38f4ece4132926447b7a17a2d620454f618935' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v1.27.0-rc.1/syncthing-linux-arm-v1.27.0-rc.1.tar.gz'; sha256='7fea3a5307a59c6dbd6bfea1609a02b074cb6565ac0a7fd88ac1f6f197cea9ad' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v1.27.0-rc.1/syncthing-linux-arm-v1.27.0-rc.1.tar.gz'; sha256='7fea3a5307a59c6dbd6bfea1609a02b074cb6565ac0a7fd88ac1f6f197cea9ad' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.0-rc.1/syncthing-linux-arm64-v1.27.0-rc.1.tar.gz'; sha256='db5f8ee434d25d192822ee252bb4fe61c0503bac7d319afd9388506c8dc67acd' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v1.27.0-rc.1/syncthing-linux-ppc64le-v1.27.0-rc.1.tar.gz'; sha256='75568b6be25143f36a23e37a1ad0df6e5b64cafc476e60623178c583e65922af' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.0-rc.1/syncthing-linux-riscv64-v1.27.0-rc.1.tar.gz'; sha256='82486f57946bc2d74c9c2283d88f6d3e05887a392c954b16972bb0f6eff5fc96' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v1.27.0-rc.1/syncthing-linux-s390x-v1.27.0-rc.1.tar.gz'; sha256='54a1efc9432f6e7e14f827c6fe4c9eaf0bd1f2fe2baa5398c6633124f11b3927' ;; \
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
