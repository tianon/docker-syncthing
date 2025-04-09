#
# NOTE: THIS DOCKERFILE IS GENERATED VIA "apply-templates.sh"
#
# PLEASE DO NOT EDIT IT DIRECTLY.
#

FROM alpine:3.21

RUN set -eux; \
	addgroup -g 1000 user; \
	adduser -u 1000 -G user -D user

# https://github.com/syncthing/syncthing/releases
ENV SYNCTHING_VERSION 2.0.0-beta.8

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-beta.8/syncthing-linux-386-v2.0.0-beta.8.tar.gz'; sha256='f7f18c1790811f3617ca4dda5a6159a8d02ec43132796af18405edb2a3dacf46' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-beta.8/syncthing-linux-amd64-v2.0.0-beta.8.tar.gz'; sha256='f9853a05ba207e2b43bf2d55cb939fb18e476b77a5e164bfa9f0b9a30c097e44' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-beta.8/syncthing-linux-arm-v2.0.0-beta.8.tar.gz'; sha256='9daecb823233cce2f18f55a0bbc7808a94a3aa0177561f0c5f62bfc4d3b23215' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-beta.8/syncthing-linux-arm-v2.0.0-beta.8.tar.gz'; sha256='9daecb823233cce2f18f55a0bbc7808a94a3aa0177561f0c5f62bfc4d3b23215' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-beta.8/syncthing-linux-arm64-v2.0.0-beta.8.tar.gz'; sha256='959e103bfaf738bdd57c88a7fb77183a106b47225e1269bd6bbbd15d45aa178f' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-beta.8/syncthing-linux-ppc64le-v2.0.0-beta.8.tar.gz'; sha256='dffeafc1d658467a4377b840e321da2aa3435e8344520d0ce8acea9aca5ab172' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-beta.8/syncthing-linux-riscv64-v2.0.0-beta.8.tar.gz'; sha256='c9363cdb8e06def3a56d9a4a867b0cde20fc6b423016cebd28bfe6414c156d45' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-beta.8/syncthing-linux-s390x-v2.0.0-beta.8.tar.gz'; sha256='560da1f0d4a579c8b3d13a8caea5563729cbb9ef845467b2a1bae337bf717f6b' ;; \
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
