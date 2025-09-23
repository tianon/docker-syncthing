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
ENV SYNCTHING_VERSION 2.0.10-rc.1

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v2.0.10-rc.1/syncthing-linux-386-v2.0.10-rc.1.tar.gz'; sha256='bc2bc54b340ad76b0632a3b96b2a291e8a05d45d16f175fbe8b1dff216b4d5bb' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.10-rc.1/syncthing-linux-amd64-v2.0.10-rc.1.tar.gz'; sha256='a565ca2a27077ffcc592299fffb8a08291a49e199c302b809f892ce0ef448b1f' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v2.0.10-rc.1/syncthing-linux-arm-v2.0.10-rc.1.tar.gz'; sha256='965340bf5e03dc5f67065c2ae4161da61eca6d542abad48b6f74f5445e12b3de' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v2.0.10-rc.1/syncthing-linux-arm-v2.0.10-rc.1.tar.gz'; sha256='965340bf5e03dc5f67065c2ae4161da61eca6d542abad48b6f74f5445e12b3de' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.10-rc.1/syncthing-linux-arm64-v2.0.10-rc.1.tar.gz'; sha256='90b2426aeb554f0c9576703358b81fc27c6fa9650bd490ae1ee1a98fb369e3b8' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v2.0.10-rc.1/syncthing-linux-ppc64le-v2.0.10-rc.1.tar.gz'; sha256='866fdfe40c610c693b46477a56e0675f04b30896177ced475606b01585b4c522' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.10-rc.1/syncthing-linux-riscv64-v2.0.10-rc.1.tar.gz'; sha256='8cac19893a6046621af183210169bcffe39018b4226ecf83f0c41e351f41c421' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v2.0.10-rc.1/syncthing-linux-s390x-v2.0.10-rc.1.tar.gz'; sha256='ae6e0a000b385421af881fc6f215290880545daf948d0be5dc392d9cb61caafb' ;; \
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
