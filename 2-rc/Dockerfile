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
ENV SYNCTHING_VERSION 2.0.0-rc.20

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.20/syncthing-linux-386-v2.0.0-rc.20.tar.gz'; sha256='4fbf10b115ccbd8d08ff66d9599ec140d595c16eda466d10269f02713e4e12ab' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.20/syncthing-linux-amd64-v2.0.0-rc.20.tar.gz'; sha256='22c7f0372241f69272d121fd170b9e71dfe1590208aee61c9c4c74391e4552d1' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.20/syncthing-linux-arm-v2.0.0-rc.20.tar.gz'; sha256='f9f84e298d4b3db7125e96ee7f96d01a4cc5fc80bfe8b53f9a3c42296f7a7d3b' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.20/syncthing-linux-arm-v2.0.0-rc.20.tar.gz'; sha256='f9f84e298d4b3db7125e96ee7f96d01a4cc5fc80bfe8b53f9a3c42296f7a7d3b' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.20/syncthing-linux-arm64-v2.0.0-rc.20.tar.gz'; sha256='fedae9201c8d637ac31ed6a662b187d8a4429107bc595a032597871b86af4b0c' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.20/syncthing-linux-ppc64le-v2.0.0-rc.20.tar.gz'; sha256='0e646debdd80bf6a2d13ae15dfeb8da5676798f5585b1bfeca6162750a4e6cbc' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.20/syncthing-linux-riscv64-v2.0.0-rc.20.tar.gz'; sha256='ea30f2a41af64dc5fed68d0f64d46bf643ad0f03476cd10f0e0886d34de3ab4b' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.20/syncthing-linux-s390x-v2.0.0-rc.20.tar.gz'; sha256='4e6e39307e283c0de810a1f54e667ad35838d3c07f40e36f334e7cf0cd70d915' ;; \
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
