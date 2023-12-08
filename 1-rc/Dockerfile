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
ENV SYNCTHING_VERSION 1.27.1-rc.1

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v1.27.1-rc.1/syncthing-linux-386-v1.27.1-rc.1.tar.gz'; sha256='ee20e1e6f9a344ed9200c41ec578634df163433d9cc3e850037372a1428f9786' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.1-rc.1/syncthing-linux-amd64-v1.27.1-rc.1.tar.gz'; sha256='3a70f4ae03aab26ab3e672929b5fdf2026258629d419e14cba937090c009b864' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v1.27.1-rc.1/syncthing-linux-arm-v1.27.1-rc.1.tar.gz'; sha256='bcc4d98953257b0dd6077d237cd8240efe8c17374309dd947c0173620d91e050' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v1.27.1-rc.1/syncthing-linux-arm-v1.27.1-rc.1.tar.gz'; sha256='bcc4d98953257b0dd6077d237cd8240efe8c17374309dd947c0173620d91e050' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.1-rc.1/syncthing-linux-arm64-v1.27.1-rc.1.tar.gz'; sha256='4b8e7abcc5c2e3592e2ec71298943c98db408d603c8b46440cab7dfee21fb11b' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v1.27.1-rc.1/syncthing-linux-ppc64le-v1.27.1-rc.1.tar.gz'; sha256='8e9176fedb5000f90bdd0a3680a283d06e2aeab3da56a371c9e2b2a4600ab9b0' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.1-rc.1/syncthing-linux-riscv64-v1.27.1-rc.1.tar.gz'; sha256='3457243bd505197f1f96ae1508203038c500fffa57f4f134751878d29aa29cf9' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v1.27.1-rc.1/syncthing-linux-s390x-v1.27.1-rc.1.tar.gz'; sha256='f5e67e41a12c2c58cd952157a16fb974be587fe9a4b36a176f1298820709ff41' ;; \
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
