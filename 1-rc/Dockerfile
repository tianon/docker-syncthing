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
ENV SYNCTHING_VERSION 1.29.0-rc.1

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v1.29.0-rc.1/syncthing-linux-386-v1.29.0-rc.1.tar.gz'; sha256='a0880da80cd2e31fcdcecc6019e23599cff5ee80bc43347a2623c6f5a4c4d36e' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v1.29.0-rc.1/syncthing-linux-amd64-v1.29.0-rc.1.tar.gz'; sha256='99a8f7ae45073f4dfb7e943cfe615c2157881d43d67afff64586f37dfb8c104a' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v1.29.0-rc.1/syncthing-linux-arm-v1.29.0-rc.1.tar.gz'; sha256='8f34bc0aaf6663eeb10f5767ad09f8eabce5a2a199386d32f6795674030f488c' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v1.29.0-rc.1/syncthing-linux-arm-v1.29.0-rc.1.tar.gz'; sha256='8f34bc0aaf6663eeb10f5767ad09f8eabce5a2a199386d32f6795674030f488c' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v1.29.0-rc.1/syncthing-linux-arm64-v1.29.0-rc.1.tar.gz'; sha256='cbf29ed7acde9d22faacd177f0df1936dd8b6dfeba73b17d901344bc3779b9f0' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v1.29.0-rc.1/syncthing-linux-ppc64le-v1.29.0-rc.1.tar.gz'; sha256='69c606253b22c4c050b2233c3b0e0d59a722dc4f6362fb40979d478fbd361428' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v1.29.0-rc.1/syncthing-linux-riscv64-v1.29.0-rc.1.tar.gz'; sha256='20b8db660c92e37220e5317d5b68d26bdb8000a83395912625ba3b86ec41022e' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v1.29.0-rc.1/syncthing-linux-s390x-v1.29.0-rc.1.tar.gz'; sha256='24ec3bff5c3635b5fd152c07e9ad8970af98dc900d82a977c96752be90e271e5' ;; \
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
