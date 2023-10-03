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
ENV SYNCTHING_VERSION 1.25.0

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v1.25.0/syncthing-linux-386-v1.25.0.tar.gz'; sha256='03e492075e306827ea29082aa81b792d5b0d522954d6c9690c44524206755fdd' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v1.25.0/syncthing-linux-amd64-v1.25.0.tar.gz'; sha256='c16d62bc54659c27728b3501786240a06e29dd553204fd01b2968cad0bb03e4e' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v1.25.0/syncthing-linux-arm-v1.25.0.tar.gz'; sha256='1b56b165a036fca6785319a60640a1f5fb8fe2965ee7f545be7ed360db4fb6d6' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v1.25.0/syncthing-linux-arm-v1.25.0.tar.gz'; sha256='1b56b165a036fca6785319a60640a1f5fb8fe2965ee7f545be7ed360db4fb6d6' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v1.25.0/syncthing-linux-arm64-v1.25.0.tar.gz'; sha256='c65c731e9e9f1ddb58b757bde925e83077edb6b08152cc5c0138c0fba2a07470' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v1.25.0/syncthing-linux-ppc64le-v1.25.0.tar.gz'; sha256='acac1196d014d510d6f2c3d19c0c60dbfb19e1bfcbd3d90a831ed15a9afc1989' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v1.25.0/syncthing-linux-riscv64-v1.25.0.tar.gz'; sha256='23f2fd4f649cfc8a7e1661e4526a7fa6a78717604fc7095187f3eb58108d7b53' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v1.25.0/syncthing-linux-s390x-v1.25.0.tar.gz'; sha256='a039bfd1aee34a6dc98ee192b350d47d5e044a24845d6b260e20d36b7dac1fc7' ;; \
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
