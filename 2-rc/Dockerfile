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
ENV SYNCTHING_VERSION 2.0.0-rc.21

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.21/syncthing-linux-386-v2.0.0-rc.21.tar.gz'; sha256='205ad0baae05caa0d710ecff92d9b1d127804cb28e48b57a370ec1e10f9cda34' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.21/syncthing-linux-amd64-v2.0.0-rc.21.tar.gz'; sha256='b7daf5aadbbaee51af0906ecfbb7dd0596136b4aa7467f09b601747702ea4c94' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.21/syncthing-linux-arm-v2.0.0-rc.21.tar.gz'; sha256='d72ed7d6f1370bf7ffa86646063dcf43b7ef11828722f33c96899e47efbbdbb8' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.21/syncthing-linux-arm-v2.0.0-rc.21.tar.gz'; sha256='d72ed7d6f1370bf7ffa86646063dcf43b7ef11828722f33c96899e47efbbdbb8' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.21/syncthing-linux-arm64-v2.0.0-rc.21.tar.gz'; sha256='d7ce2c4b3f37d1f91922cd07bda9308422ea8f57e509b17e123467d5bd256f41' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.21/syncthing-linux-ppc64le-v2.0.0-rc.21.tar.gz'; sha256='ad78024e9d3d7e6900c105c271f34d0936056aba1121a07910688c2cbf7726d5' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.21/syncthing-linux-riscv64-v2.0.0-rc.21.tar.gz'; sha256='ce839d364da104f4d185917b66f62e9015b4e553da445d9f7a939debb3564ba1' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.21/syncthing-linux-s390x-v2.0.0-rc.21.tar.gz'; sha256='494d7c6a0d6b4394e1011b9973ef235cc61aefe53baa12bbc8ae16528c7e62e3' ;; \
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
