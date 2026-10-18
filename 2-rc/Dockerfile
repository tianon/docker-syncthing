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
ENV SYNCTHING_VERSION 2.1.7-rc.3

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v2.1.7-rc.3/syncthing-linux-386-v2.1.7-rc.3.tar.gz'; sha256='b9a6abaa87c55d2a8e7d807610d31fc8d7b2f39b90ff739e6ba07efd75dbd568' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v2.1.7-rc.3/syncthing-linux-amd64-v2.1.7-rc.3.tar.gz'; sha256='f0b53be3d70c75211460a31b6eba69886d1a5f1b185b6326fdc13210f8ed2e5b' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v2.1.7-rc.3/syncthing-linux-arm-v2.1.7-rc.3.tar.gz'; sha256='f7e732394ebdb15c603bd602a1b714677e2abd63976991d032765040d0cd6c71' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v2.1.7-rc.3/syncthing-linux-arm-v2.1.7-rc.3.tar.gz'; sha256='f7e732394ebdb15c603bd602a1b714677e2abd63976991d032765040d0cd6c71' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v2.1.7-rc.3/syncthing-linux-arm64-v2.1.7-rc.3.tar.gz'; sha256='aba5e58bc1d1e56023057b175d58ee321c6af53404ff79b6d834c6ce8d450105' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v2.1.7-rc.3/syncthing-linux-ppc64le-v2.1.7-rc.3.tar.gz'; sha256='29525953697925bac95cf468d63d10b0d529f082352a2868d011297400dedc58' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v2.1.7-rc.3/syncthing-linux-riscv64-v2.1.7-rc.3.tar.gz'; sha256='8365fc076fcc48eeef9076479daf01e530b1092a2328f2266f25595272bbd63a' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v2.1.7-rc.3/syncthing-linux-s390x-v2.1.7-rc.3.tar.gz'; sha256='3fc586ae45ded20977e41f957adaa5ce70253dd1165fb09e26771346978e2c90' ;; \
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
