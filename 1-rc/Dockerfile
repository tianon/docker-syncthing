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
ENV SYNCTHING_VERSION 1.29.5-rc.1

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v1.29.5-rc.1/syncthing-linux-386-v1.29.5-rc.1.tar.gz'; sha256='ad3e36c058cad89fd5a01420eef02ac8415eaa9f998cd5144e196122ff69e34b' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v1.29.5-rc.1/syncthing-linux-amd64-v1.29.5-rc.1.tar.gz'; sha256='96f98b526c1b998c58bd88118f5b67aa73e5206f12b18d65cefc0272068869bd' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v1.29.5-rc.1/syncthing-linux-arm-v1.29.5-rc.1.tar.gz'; sha256='31c7810772041ca865c3c542e0823ef262bc5715c933db5c42bcf6360e8e1aa2' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v1.29.5-rc.1/syncthing-linux-arm-v1.29.5-rc.1.tar.gz'; sha256='31c7810772041ca865c3c542e0823ef262bc5715c933db5c42bcf6360e8e1aa2' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v1.29.5-rc.1/syncthing-linux-arm64-v1.29.5-rc.1.tar.gz'; sha256='475300f22ba934959e6213822c09f594bf97d9ed58ccd4c4a304271bfa56e8c5' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v1.29.5-rc.1/syncthing-linux-ppc64le-v1.29.5-rc.1.tar.gz'; sha256='20b23da99a8cf616f656cfce36e917c1bfd7841223aaed3ac7eb7ff1a3a390a6' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v1.29.5-rc.1/syncthing-linux-riscv64-v1.29.5-rc.1.tar.gz'; sha256='f1dbd626685564a82dd1906b3ddb09b8234d1805ee23c9326dd843e1ec4cfda3' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v1.29.5-rc.1/syncthing-linux-s390x-v1.29.5-rc.1.tar.gz'; sha256='415207e733c7cf5f3bd4cc76564cc5daee26c69a93187661f7b87a07da0dfd68' ;; \
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
