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
ENV SYNCTHING_VERSION 2.1.3-rc.3

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v2.1.3-rc.3/syncthing-linux-386-v2.1.3-rc.3.tar.gz'; sha256='eff2e82e1540fee1712d0680a033b1b36d845772b93203047c8eb02c84def219' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v2.1.3-rc.3/syncthing-linux-amd64-v2.1.3-rc.3.tar.gz'; sha256='b5ecb002e385e61d711ac3141f67d70a17831ca8e155be6707067f30451e6141' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v2.1.3-rc.3/syncthing-linux-arm-v2.1.3-rc.3.tar.gz'; sha256='c785a9ef25f436ad7144f3dd92cde9ddfd5b0b3a803554bd2e96117522b40ae3' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v2.1.3-rc.3/syncthing-linux-arm-v2.1.3-rc.3.tar.gz'; sha256='c785a9ef25f436ad7144f3dd92cde9ddfd5b0b3a803554bd2e96117522b40ae3' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v2.1.3-rc.3/syncthing-linux-arm64-v2.1.3-rc.3.tar.gz'; sha256='143243c7b503a2c1a163ea492b13a3acf102e8bfa6d30e509227add6f5a53afe' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v2.1.3-rc.3/syncthing-linux-ppc64le-v2.1.3-rc.3.tar.gz'; sha256='c5a58247c7e1fd1e46406825935580df2e7203a9b01643b602868eb201c209dd' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v2.1.3-rc.3/syncthing-linux-riscv64-v2.1.3-rc.3.tar.gz'; sha256='e850fb93ee57eb7cacf99204e05ff95d0765dd43e99c7e417b8082896e2d342a' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v2.1.3-rc.3/syncthing-linux-s390x-v2.1.3-rc.3.tar.gz'; sha256='0d700378e132adf96d9e222025cf6619ed229fd97af78ebc5c0178be8a272ff0' ;; \
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
