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
ENV SYNCTHING_VERSION 1.26.1

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v1.26.1/syncthing-linux-386-v1.26.1.tar.gz'; sha256='3f8273d67c526c09272b131774478c67b63615fdd572cb9e3320ad3cb3a9fc79' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v1.26.1/syncthing-linux-amd64-v1.26.1.tar.gz'; sha256='71f79ea13938657a75e258eb1cccdec360819117060f5feabef467df625f963e' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v1.26.1/syncthing-linux-arm-v1.26.1.tar.gz'; sha256='cf87364cec99ea1a5c05290d9f6c9c9a8557f31eba7ff4ceeb062f33f0ee1905' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v1.26.1/syncthing-linux-arm-v1.26.1.tar.gz'; sha256='cf87364cec99ea1a5c05290d9f6c9c9a8557f31eba7ff4ceeb062f33f0ee1905' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v1.26.1/syncthing-linux-arm64-v1.26.1.tar.gz'; sha256='3b0642ddf550f6ab72fb450508ca201b041601e4d651581c9db60b5a183904de' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v1.26.1/syncthing-linux-ppc64le-v1.26.1.tar.gz'; sha256='8aa0143bfb42e3cda2f688c4e78293d0d1c812b07252bf11a762c82d546f551c' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v1.26.1/syncthing-linux-riscv64-v1.26.1.tar.gz'; sha256='7b6c8f6e1de46f1bf7f734e0bf3e719b110c61c48e38b3e91252968743af5857' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v1.26.1/syncthing-linux-s390x-v1.26.1.tar.gz'; sha256='5b3b05968c80d01f560f5dcbaeeff1e118ff2f7b12081e59855d73042d0d6750' ;; \
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
