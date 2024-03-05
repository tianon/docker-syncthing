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
ENV SYNCTHING_VERSION 1.27.4

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v1.27.4/syncthing-linux-386-v1.27.4.tar.gz'; sha256='022aab7a6eeb74b720ddfd6ca9cf6d90b928b286c0df384a5d9de597c861ffe6' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.4/syncthing-linux-amd64-v1.27.4.tar.gz'; sha256='9c0e68699eae5e002c77bffc2ad676d162b7490a752f2f034325e2d8a83ccb04' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v1.27.4/syncthing-linux-arm-v1.27.4.tar.gz'; sha256='53ab40427422b9bafa211793e441514d12efc39e0d51f1d19c0934897d9b9a47' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v1.27.4/syncthing-linux-arm-v1.27.4.tar.gz'; sha256='53ab40427422b9bafa211793e441514d12efc39e0d51f1d19c0934897d9b9a47' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.4/syncthing-linux-arm64-v1.27.4.tar.gz'; sha256='c6b90c5807e57cb75a7e4b73e04a3a3168ec365c3fed62ba75eaa14c271fd410' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v1.27.4/syncthing-linux-ppc64le-v1.27.4.tar.gz'; sha256='d8722b04b53e51f72bf1dc50d9f3e92db4822167278afe2d41450c9f56ad2129' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.4/syncthing-linux-riscv64-v1.27.4.tar.gz'; sha256='7be5c8606e4ff81c82b0587b06f4e62af635efaa03ceffa0bf0340ef73db29c1' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v1.27.4/syncthing-linux-s390x-v1.27.4.tar.gz'; sha256='5ecbaacaaf6d9ac528ee258b27e13e22b3345bb2543c7960c87fd9ae1facc19e' ;; \
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
