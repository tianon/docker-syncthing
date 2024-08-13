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
ENV SYNCTHING_VERSION 1.27.11-rc.1

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v1.27.11-rc.1/syncthing-linux-386-v1.27.11-rc.1.tar.gz'; sha256='a374687cc471550010ec3bf093b08d2e6b548b841f5b3c6a54e411e375d98cb7' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.11-rc.1/syncthing-linux-amd64-v1.27.11-rc.1.tar.gz'; sha256='bead78007caff05d524ac96a20369be3f444b7176985c414227bfdb7ac53ee58' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v1.27.11-rc.1/syncthing-linux-arm-v1.27.11-rc.1.tar.gz'; sha256='224f31bfdad9cdb4178ababdb77a539a545f9d77e8f40f4238a348f41c580112' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v1.27.11-rc.1/syncthing-linux-arm-v1.27.11-rc.1.tar.gz'; sha256='224f31bfdad9cdb4178ababdb77a539a545f9d77e8f40f4238a348f41c580112' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.11-rc.1/syncthing-linux-arm64-v1.27.11-rc.1.tar.gz'; sha256='b87661b17578e58e6aacc4360cb9cec346d1e6b265d756d8357a5b8accde5bb6' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v1.27.11-rc.1/syncthing-linux-ppc64le-v1.27.11-rc.1.tar.gz'; sha256='3f2bc28451ea573e1a01f70127bc85a44c89b8d189d1c6326a57d556d042ab00' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.11-rc.1/syncthing-linux-riscv64-v1.27.11-rc.1.tar.gz'; sha256='d24e067d0c352a0287ff87b605bca7e91a3072c64495ac1da7abbf3cdba4fcd3' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v1.27.11-rc.1/syncthing-linux-s390x-v1.27.11-rc.1.tar.gz'; sha256='5f0d44c4a0ffefa80951ab32070ce5373c9cb60a253e5a4de2040e23de32a8b1' ;; \
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
