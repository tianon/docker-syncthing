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
ENV SYNCTHING_VERSION 2.1.6-rc.1

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v2.1.6-rc.1/syncthing-linux-386-v2.1.6-rc.1.tar.gz'; sha256='227f89c3ae3323022588e154cb36bd4a8a695121746359ea5ea9c280f50a98c1' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v2.1.6-rc.1/syncthing-linux-amd64-v2.1.6-rc.1.tar.gz'; sha256='74e941735a3a3779871bb1e5dae61929c539cccc093dec7784e7b73d1287494a' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v2.1.6-rc.1/syncthing-linux-arm-v2.1.6-rc.1.tar.gz'; sha256='b4ae7f3ee8421e28ea2b035a897c59e145b6c8e37498a2ff7ebe914576c0abaa' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v2.1.6-rc.1/syncthing-linux-arm-v2.1.6-rc.1.tar.gz'; sha256='b4ae7f3ee8421e28ea2b035a897c59e145b6c8e37498a2ff7ebe914576c0abaa' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v2.1.6-rc.1/syncthing-linux-arm64-v2.1.6-rc.1.tar.gz'; sha256='2a73b81642c6f1ae801d98cdddf42266cad81507f6242bc5dd26d2f4181856fe' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v2.1.6-rc.1/syncthing-linux-ppc64le-v2.1.6-rc.1.tar.gz'; sha256='d4a9ed80c1acab4c95a5a0e2fbbf3c0f19f560fce6cbd5d1974b332515fb229f' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v2.1.6-rc.1/syncthing-linux-riscv64-v2.1.6-rc.1.tar.gz'; sha256='cc5d0ac2a31d30ea904b1029ba82b359d421f7e889cfabc2decfebe6037cf7ff' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v2.1.6-rc.1/syncthing-linux-s390x-v2.1.6-rc.1.tar.gz'; sha256='605927987bb84a5594e0c667561f7d2f8a98f42126eb8bcad06aa2675cad794c' ;; \
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
