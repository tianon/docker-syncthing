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
ENV SYNCTHING_VERSION 1.29.3-rc.2

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v1.29.3-rc.2/syncthing-linux-386-v1.29.3-rc.2.tar.gz'; sha256='6d60f79c9e3374c68ce54dc1008d9863c7564316eceb92dec1d5350e59b1cfbf' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v1.29.3-rc.2/syncthing-linux-amd64-v1.29.3-rc.2.tar.gz'; sha256='cb344dbf447c657147a3ed73b5ee9b12f034b890f06c69a950605bc7d80614e2' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v1.29.3-rc.2/syncthing-linux-arm-v1.29.3-rc.2.tar.gz'; sha256='47ea73f60db8ccd0c99608f03813cab2f91acd1453182a15773dc9faa83cc26b' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v1.29.3-rc.2/syncthing-linux-arm-v1.29.3-rc.2.tar.gz'; sha256='47ea73f60db8ccd0c99608f03813cab2f91acd1453182a15773dc9faa83cc26b' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v1.29.3-rc.2/syncthing-linux-arm64-v1.29.3-rc.2.tar.gz'; sha256='3e3b55f39ffd32d85136473d7fe61ed8f1fb957f5f640b29a2545878784e1b8c' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v1.29.3-rc.2/syncthing-linux-ppc64le-v1.29.3-rc.2.tar.gz'; sha256='33d74fc212a4d1ea2e57a59f10143a0fc026aa17148285f0333c1e49b458a40f' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v1.29.3-rc.2/syncthing-linux-riscv64-v1.29.3-rc.2.tar.gz'; sha256='5129bee834642b23cbe0f4a4e2da2e749434326baffcf49925ec14838bbb3a79' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v1.29.3-rc.2/syncthing-linux-s390x-v1.29.3-rc.2.tar.gz'; sha256='ddb43257607b5753f640f2c57807111429b77f5ec7162fcd2ea7e7209e34f88d' ;; \
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
