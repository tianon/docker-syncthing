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
ENV SYNCTHING_VERSION 1.24.0-rc.1

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v1.24.0-rc.1/syncthing-linux-386-v1.24.0-rc.1.tar.gz'; sha256='15d015f45032567f096a65b9b0c2e82f736e4c087d9c66e9e655cfbb4d9b5910' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v1.24.0-rc.1/syncthing-linux-amd64-v1.24.0-rc.1.tar.gz'; sha256='26c9dd01d42f063e46feff202ea0a6d20eea73f6250323ee32a1b3695dc9a57c' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v1.24.0-rc.1/syncthing-linux-arm-v1.24.0-rc.1.tar.gz'; sha256='9ec8b4572ff5c1d1494c3b06731656ff0937502ef8adca85e7631dfe59e4b0a7' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v1.24.0-rc.1/syncthing-linux-arm-v1.24.0-rc.1.tar.gz'; sha256='9ec8b4572ff5c1d1494c3b06731656ff0937502ef8adca85e7631dfe59e4b0a7' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v1.24.0-rc.1/syncthing-linux-arm64-v1.24.0-rc.1.tar.gz'; sha256='4464faf9154064d41a0205ea2e5fa24f56f475d96fb35d7172ac39e59aa8de11' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v1.24.0-rc.1/syncthing-linux-ppc64le-v1.24.0-rc.1.tar.gz'; sha256='94a0758caaf16d75c34c810a58b9dc2abac254fc05c20a36667982b9088b297a' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v1.24.0-rc.1/syncthing-linux-riscv64-v1.24.0-rc.1.tar.gz'; sha256='460696a62b143fa73731b4172ab3b1bf0484d4938764932abb493f1576e3c7b7' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v1.24.0-rc.1/syncthing-linux-s390x-v1.24.0-rc.1.tar.gz'; sha256='ac22d91e4e2bece89b5df7396c5b758c56aff8decebab4d6e44d4c0a1d4b61ec' ;; \
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
	syncthing -help

USER user
CMD ["syncthing"]
