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
ENV SYNCTHING_VERSION 1.27.1

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v1.27.1/syncthing-linux-386-v1.27.1.tar.gz'; sha256='f8287589e10a36516b51e258ff37beaf795d145a0c12a7cf94bf2e6099d83a79' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.1/syncthing-linux-amd64-v1.27.1.tar.gz'; sha256='43c5983b9e79c88bbf8971bcf6ee9aedaf11c2c9da3b953d1a806c3c7381ed8a' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v1.27.1/syncthing-linux-arm-v1.27.1.tar.gz'; sha256='bce93c587b3d3b94563b5ff901c3e177cdcfb9e1297997a733f5508c524c7932' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v1.27.1/syncthing-linux-arm-v1.27.1.tar.gz'; sha256='bce93c587b3d3b94563b5ff901c3e177cdcfb9e1297997a733f5508c524c7932' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.1/syncthing-linux-arm64-v1.27.1.tar.gz'; sha256='39cddfea24e31b339e321bc2011ce2984efc4ca8b093f713ec2ab94145ae3131' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v1.27.1/syncthing-linux-ppc64le-v1.27.1.tar.gz'; sha256='a0df66193a3fc480701acc4b82c28f829a8239a265d36dadc7966ccdf515469a' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.1/syncthing-linux-riscv64-v1.27.1.tar.gz'; sha256='dec7fc730f886b85153f0548f2532ec4cbbdac9a4108f0c644359d79edfed6bf' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v1.27.1/syncthing-linux-s390x-v1.27.1.tar.gz'; sha256='7ea0bce3ba1f0eb4eb506d2f965392d3dcfdc9fcbaba543fcab11f9d938f5383' ;; \
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
