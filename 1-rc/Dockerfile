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
ENV SYNCTHING_VERSION 1.25.0-rc.1

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v1.25.0-rc.1/syncthing-linux-386-v1.25.0-rc.1.tar.gz'; sha256='960dedd9a9477f26715bece93ef1b3bd978d54f8c3382070fa5000c28237a3c3' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v1.25.0-rc.1/syncthing-linux-amd64-v1.25.0-rc.1.tar.gz'; sha256='8d7db1446c409543f9b7a00d7304321fc5a030e2786acf77c5dbd18adf1cec40' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v1.25.0-rc.1/syncthing-linux-arm-v1.25.0-rc.1.tar.gz'; sha256='3a3a43ca3b0462c82698e2ac65fbd51674ce1d34a081627ea86dc95f00a6ffba' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v1.25.0-rc.1/syncthing-linux-arm-v1.25.0-rc.1.tar.gz'; sha256='3a3a43ca3b0462c82698e2ac65fbd51674ce1d34a081627ea86dc95f00a6ffba' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v1.25.0-rc.1/syncthing-linux-arm64-v1.25.0-rc.1.tar.gz'; sha256='c757501dd7fd5922068796fec409ef277426d6f964f1abfc14b4776f4f1e52ce' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v1.25.0-rc.1/syncthing-linux-ppc64le-v1.25.0-rc.1.tar.gz'; sha256='307c5f265578efd6273c02a5fbfccbcbd82e427bd505a38e2735d259310daf1b' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v1.25.0-rc.1/syncthing-linux-riscv64-v1.25.0-rc.1.tar.gz'; sha256='a39bfcd4e3727401071a8b6c162026c8c27eb28e31bd6bc114a84938a753d2e0' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v1.25.0-rc.1/syncthing-linux-s390x-v1.25.0-rc.1.tar.gz'; sha256='b3654ef56d4ca10ee2a5fbc11bc4d5fff44d77de25c535d904d64fc162b3ecf9' ;; \
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
	syncthing -help

USER user
CMD ["syncthing"]
