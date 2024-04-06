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
ENV SYNCTHING_VERSION 1.27.6-rc.1

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v1.27.6-rc.1/syncthing-linux-386-v1.27.6-rc.1.tar.gz'; sha256='877d684f7e966c58668475e0d33b5840563cd866bdeaaf037fe972f5b47236a5' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.6-rc.1/syncthing-linux-amd64-v1.27.6-rc.1.tar.gz'; sha256='7b759240aa096d13a9c39cdf9b8e9979fd52814467ad554d055036c63eb21167' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v1.27.6-rc.1/syncthing-linux-arm-v1.27.6-rc.1.tar.gz'; sha256='87b6f90f2cabc966ca5294ee810aa915e28f52bedf1ee4151073538e8c8a4486' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v1.27.6-rc.1/syncthing-linux-arm-v1.27.6-rc.1.tar.gz'; sha256='87b6f90f2cabc966ca5294ee810aa915e28f52bedf1ee4151073538e8c8a4486' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.6-rc.1/syncthing-linux-arm64-v1.27.6-rc.1.tar.gz'; sha256='f52d3eed0f173b1bfd310f591dd51d0edf615cba4fd0056b9fe81bcead7d69f3' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v1.27.6-rc.1/syncthing-linux-ppc64le-v1.27.6-rc.1.tar.gz'; sha256='1a98de0dcd4f578f64837779f068cdcf36918fe26cc9ab6771038e780a732fcd' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.6-rc.1/syncthing-linux-riscv64-v1.27.6-rc.1.tar.gz'; sha256='38e819c366968522461d5ce2eaf0ebf434246bf3f22ccac27f2bfaf5f419b3af' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v1.27.6-rc.1/syncthing-linux-s390x-v1.27.6-rc.1.tar.gz'; sha256='1f7f058641e9cb2e93f6557bbb0e87753889d8dc7cb687d11a43360c5b636be6' ;; \
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
