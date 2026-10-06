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
ENV SYNCTHING_VERSION 2.1.6

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v2.1.6/syncthing-linux-386-v2.1.6.tar.gz'; sha256='31e621ed61b8a2a0a7959c66c7b344e52cb1066255a8045266d4f2ebaa1deb13' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v2.1.6/syncthing-linux-amd64-v2.1.6.tar.gz'; sha256='524ef4e1df1850b719e2378c8369956f4e5f2ab9a46fdf7f45f2b925012147aa' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v2.1.6/syncthing-linux-arm-v2.1.6.tar.gz'; sha256='2a558bbb4b960c6a2314406cdd16f99c94f74c92da7c652e9de36d1d1945d718' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v2.1.6/syncthing-linux-arm-v2.1.6.tar.gz'; sha256='2a558bbb4b960c6a2314406cdd16f99c94f74c92da7c652e9de36d1d1945d718' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v2.1.6/syncthing-linux-arm64-v2.1.6.tar.gz'; sha256='f054de02462d5d58bd126908f2f92b63aba74f162a5be85e50e96d656e7db47d' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v2.1.6/syncthing-linux-ppc64le-v2.1.6.tar.gz'; sha256='5dcaf7cf41ff47ac6df6f16894c87da438bce6245023fa068dbb98cf657dfe83' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v2.1.6/syncthing-linux-riscv64-v2.1.6.tar.gz'; sha256='be0fb60df0e8d965f99adbeca5e121186e2ce9dd1dcb86989dc555ac45b38c68' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v2.1.6/syncthing-linux-s390x-v2.1.6.tar.gz'; sha256='532e03996b24e7e66d2a589e4f0aa607b33fa3e384caf335fa8224bd648e26d4' ;; \
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
