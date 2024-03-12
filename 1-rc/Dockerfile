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
ENV SYNCTHING_VERSION 1.27.5-rc.1

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v1.27.5-rc.1/syncthing-linux-386-v1.27.5-rc.1.tar.gz'; sha256='2954b3bd0fc5685d964a1196f6422297261d9e7d6d2c07a2b39434d1f6b12f40' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.5-rc.1/syncthing-linux-amd64-v1.27.5-rc.1.tar.gz'; sha256='5141aa8879d0bf4d3dabb68bfaf4b2c845320ec7880118de5bea9535dc4fd40e' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v1.27.5-rc.1/syncthing-linux-arm-v1.27.5-rc.1.tar.gz'; sha256='7411cf2a42928f9fb57b2c44f2a86008e310de6f13b690c2c870524bb8b129e5' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v1.27.5-rc.1/syncthing-linux-arm-v1.27.5-rc.1.tar.gz'; sha256='7411cf2a42928f9fb57b2c44f2a86008e310de6f13b690c2c870524bb8b129e5' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.5-rc.1/syncthing-linux-arm64-v1.27.5-rc.1.tar.gz'; sha256='77998285c3e0ba7ede21c2884e6db595f06ac9643db6b644b8bdefac41700479' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v1.27.5-rc.1/syncthing-linux-ppc64le-v1.27.5-rc.1.tar.gz'; sha256='8e0019b91cf8f1f82cc7e736e561e5065211dc6d0fbaf897bd8dccb98e33e85d' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.5-rc.1/syncthing-linux-riscv64-v1.27.5-rc.1.tar.gz'; sha256='fbf451c60e80e011e84fe9f4f2cdb7b9d4f0d57ce984e8e9aff98ef7467bbc40' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v1.27.5-rc.1/syncthing-linux-s390x-v1.27.5-rc.1.tar.gz'; sha256='e5311da13a0c0dd08dc86fc74f3683388c9b70c49032ebd6a5903e722c422625' ;; \
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
