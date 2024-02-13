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
ENV SYNCTHING_VERSION 1.27.4-rc.1

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v1.27.4-rc.1/syncthing-linux-386-v1.27.4-rc.1.tar.gz'; sha256='54a4ec4b48c38b651af7c4a7ae826f39b6de9c0eef9c9be673383c410fbdaa82' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.4-rc.1/syncthing-linux-amd64-v1.27.4-rc.1.tar.gz'; sha256='2d4e044fb6d99921ec837c1868059a56959463a07dc24f6d6402b5a9dee073de' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v1.27.4-rc.1/syncthing-linux-arm-v1.27.4-rc.1.tar.gz'; sha256='1d8b27776e358ec45bdabed16285df8aa19fa7cacde9d5cb1691872ca97c47db' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v1.27.4-rc.1/syncthing-linux-arm-v1.27.4-rc.1.tar.gz'; sha256='1d8b27776e358ec45bdabed16285df8aa19fa7cacde9d5cb1691872ca97c47db' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.4-rc.1/syncthing-linux-arm64-v1.27.4-rc.1.tar.gz'; sha256='7c0b34f400f8f9edf5d8503dc3ded0b114847697516d06fc0a1879a2f2871dc3' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v1.27.4-rc.1/syncthing-linux-ppc64le-v1.27.4-rc.1.tar.gz'; sha256='e7485833d794eae1d60318f5de2f79d679398d3ff95c684edc2e6add9cf38fa1' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.4-rc.1/syncthing-linux-riscv64-v1.27.4-rc.1.tar.gz'; sha256='02b150e92da0895bf80fc3006d824340c871952bc3d779a42536fc3f9e87cb79' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v1.27.4-rc.1/syncthing-linux-s390x-v1.27.4-rc.1.tar.gz'; sha256='ed436655503e2028d4bd57e444af9508f509bb242fdd4b252fabefdb68d40936' ;; \
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
