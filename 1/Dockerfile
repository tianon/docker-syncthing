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
ENV SYNCTHING_VERSION 1.26.0

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v1.26.0/syncthing-linux-386-v1.26.0.tar.gz'; sha256='e578ed996ef783f7b44871e7252ebea930452cd00cf154431009678016dc292b' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v1.26.0/syncthing-linux-amd64-v1.26.0.tar.gz'; sha256='fb8d2f97d1e3403ee0bf5cfe2258ab360a7d5778eb0b9e1e9984da6ce260cd83' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v1.26.0/syncthing-linux-arm-v1.26.0.tar.gz'; sha256='9474715e81edd880abe085c0bb9f25ebce144ffcca45e7d22db3410dc1cc084a' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v1.26.0/syncthing-linux-arm-v1.26.0.tar.gz'; sha256='9474715e81edd880abe085c0bb9f25ebce144ffcca45e7d22db3410dc1cc084a' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v1.26.0/syncthing-linux-arm64-v1.26.0.tar.gz'; sha256='90041a4e9dd600ed072bcd8877c6af4ede64b7346df0d420f6742b849dd24f81' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v1.26.0/syncthing-linux-ppc64le-v1.26.0.tar.gz'; sha256='1bc0217dea5d90461935b771046a5f2c73bfc0c8d59d463a8bbfd4ff2f56e411' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v1.26.0/syncthing-linux-riscv64-v1.26.0.tar.gz'; sha256='c376cadb177f2d1060d685f2ea76190a9dfa87433716a2feba051684f26a5f4d' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v1.26.0/syncthing-linux-s390x-v1.26.0.tar.gz'; sha256='18027149ef5ed3a533899b444dfa45fe151bb9df2279ec0643caa33b0b3a8cd7' ;; \
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
