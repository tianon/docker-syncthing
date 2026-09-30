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
ENV SYNCTHING_VERSION 2.1.6-rc.4

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v2.1.6-rc.4/syncthing-linux-386-v2.1.6-rc.4.tar.gz'; sha256='43a1ac6bb21d8d117df3c3d3df90cce60bf507bb321a5625a101d18acb046829' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v2.1.6-rc.4/syncthing-linux-amd64-v2.1.6-rc.4.tar.gz'; sha256='ad66e31a2b90e8c3409b079c3db27665b7a1f97b29bc07c9ee498586cf42b859' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v2.1.6-rc.4/syncthing-linux-arm-v2.1.6-rc.4.tar.gz'; sha256='1d313e066b2f0b73a78f9434e3c8451cb1fa7b5f8e90843da511cb70defc0e68' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v2.1.6-rc.4/syncthing-linux-arm-v2.1.6-rc.4.tar.gz'; sha256='1d313e066b2f0b73a78f9434e3c8451cb1fa7b5f8e90843da511cb70defc0e68' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v2.1.6-rc.4/syncthing-linux-arm64-v2.1.6-rc.4.tar.gz'; sha256='c8ea8753a6fd4c9f47b6b9c0c2338ac3f7c8de12c105db25e1bfcd2276b52a8a' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v2.1.6-rc.4/syncthing-linux-ppc64le-v2.1.6-rc.4.tar.gz'; sha256='3e9e5db501eb720229b6c2ed493a8637056c34e19a74b900d542f61b3830cf9d' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v2.1.6-rc.4/syncthing-linux-riscv64-v2.1.6-rc.4.tar.gz'; sha256='5f4ff37520303a13e0c13761fe92b6ad2b3633ecae16c5ce441c315cd08a7688' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v2.1.6-rc.4/syncthing-linux-s390x-v2.1.6-rc.4.tar.gz'; sha256='ed1dd5ab8f9c61084b01933d217a68c5680911fe740cb45f07a688d297f80909' ;; \
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
