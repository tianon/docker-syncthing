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
ENV SYNCTHING_VERSION 1.29.3

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v1.29.3/syncthing-linux-386-v1.29.3.tar.gz'; sha256='a720acdc839c3e66b14076bf8bf268f19d99b15a5ae9a4592b0f98cd1e296af9' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v1.29.3/syncthing-linux-amd64-v1.29.3.tar.gz'; sha256='4d290e08ac9895afeec4e9d1336122ceacf4afa68b1931433037004060c7cb95' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v1.29.3/syncthing-linux-arm-v1.29.3.tar.gz'; sha256='8a489c0c4609d1bf1b465e014aa146a5c5e2c2eafb348ab89ea92d9f251ed1e7' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v1.29.3/syncthing-linux-arm-v1.29.3.tar.gz'; sha256='8a489c0c4609d1bf1b465e014aa146a5c5e2c2eafb348ab89ea92d9f251ed1e7' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v1.29.3/syncthing-linux-arm64-v1.29.3.tar.gz'; sha256='9d80d9501ee968e5078ff9e8e96b9727b50e258114a49ac4ec772dd3222fc4fe' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v1.29.3/syncthing-linux-ppc64le-v1.29.3.tar.gz'; sha256='1d981fa04243dd9557df887e1f3bb460860b81ddc67fac7b9d88afde8f657eae' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v1.29.3/syncthing-linux-riscv64-v1.29.3.tar.gz'; sha256='72c1e5e38f3bf366206e342f645e67ab59092aace7f2cd1d59603ed931efe3bc' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v1.29.3/syncthing-linux-s390x-v1.29.3.tar.gz'; sha256='e3fbc6412ee0dba657a3163aeb4392dd3e4e001071ca2a771ce09818cb32658d' ;; \
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
