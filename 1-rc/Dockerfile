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
ENV SYNCTHING_VERSION 1.29.0-rc.2

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v1.29.0-rc.2/syncthing-linux-386-v1.29.0-rc.2.tar.gz'; sha256='4b0e8d9c13767d840572577b4f9ac1d0c5c965c7defb93b6a1e4341f77cb2b3a' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v1.29.0-rc.2/syncthing-linux-amd64-v1.29.0-rc.2.tar.gz'; sha256='af6602e0c3add4d8591e3b22e42e704b04f449462d28a3667a718f67436fb2f4' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v1.29.0-rc.2/syncthing-linux-arm-v1.29.0-rc.2.tar.gz'; sha256='54ff9a1bb3bf167612c10f3e0431e21bd64698161981356aaed354851c6d36dd' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v1.29.0-rc.2/syncthing-linux-arm-v1.29.0-rc.2.tar.gz'; sha256='54ff9a1bb3bf167612c10f3e0431e21bd64698161981356aaed354851c6d36dd' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v1.29.0-rc.2/syncthing-linux-arm64-v1.29.0-rc.2.tar.gz'; sha256='cf261917ce0ecfe3dac9f411e0e6af14f229261ecbad4547677c276ad8e65734' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v1.29.0-rc.2/syncthing-linux-ppc64le-v1.29.0-rc.2.tar.gz'; sha256='b8afd59ff4fe3d0dd284ac3bcd4f14230f36af4cac58d01cde8b04113cfb7960' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v1.29.0-rc.2/syncthing-linux-riscv64-v1.29.0-rc.2.tar.gz'; sha256='6d9c4fbca6d08e8157faa9af528187a5dee25ef4d64ae70c4a8cb866899b14d6' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v1.29.0-rc.2/syncthing-linux-s390x-v1.29.0-rc.2.tar.gz'; sha256='7799300a2755e3c7ed20fa46994ba19445a43b074671d64b5b44ddca1a61fbe5' ;; \
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
