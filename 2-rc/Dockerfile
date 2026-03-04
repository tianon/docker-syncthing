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
ENV SYNCTHING_VERSION 2.0.16-rc.1

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v2.0.16-rc.1/syncthing-linux-386-v2.0.16-rc.1.tar.gz'; sha256='f093ef6da553555e1d3dd4268af7eca2c373adb6ff4cb3d2611073c92593b687' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.16-rc.1/syncthing-linux-amd64-v2.0.16-rc.1.tar.gz'; sha256='2a7e55430302aaab245977458aba2e930c32cffa8cd10f72c451ec4b661b0497' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v2.0.16-rc.1/syncthing-linux-arm-v2.0.16-rc.1.tar.gz'; sha256='7dde55243c420693bcc6668e3b1db72d4df980631ff0f558885add872ece79a1' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v2.0.16-rc.1/syncthing-linux-arm-v2.0.16-rc.1.tar.gz'; sha256='7dde55243c420693bcc6668e3b1db72d4df980631ff0f558885add872ece79a1' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.16-rc.1/syncthing-linux-arm64-v2.0.16-rc.1.tar.gz'; sha256='00fd299157e9d0155b06d8cfc6c9abdd902b7b7b06f216e0803c751569b2d70a' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v2.0.16-rc.1/syncthing-linux-ppc64le-v2.0.16-rc.1.tar.gz'; sha256='459fdee832cf424bad0cbb0dbbe109183a029b99ac80b32b7c326c166c384412' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.16-rc.1/syncthing-linux-riscv64-v2.0.16-rc.1.tar.gz'; sha256='f93e6d3513490296d15712bee943ff1e479c44562765cdcc6c2c9534d22b35f0' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v2.0.16-rc.1/syncthing-linux-s390x-v2.0.16-rc.1.tar.gz'; sha256='d5849ef4de537e52ed72842b3e161a5076384d5bc79f0404cc56d8b5dbea4cff' ;; \
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
