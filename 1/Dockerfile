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
ENV SYNCTHING_VERSION 1.29.7

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v1.29.7/syncthing-linux-386-v1.29.7.tar.gz'; sha256='98d7beb477aa16b5fe8e4b29790d80462071dd8205fa0616de8270b2dc69481d' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v1.29.7/syncthing-linux-amd64-v1.29.7.tar.gz'; sha256='f0fa3ab78e3d1254c72a64b65c32cd558e4fbae77aec7fa160f347a704ac2e52' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v1.29.7/syncthing-linux-arm-v1.29.7.tar.gz'; sha256='1052a0b2f96615e05690793ad658b41c72200256f6216d036a2643ca302c3005' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v1.29.7/syncthing-linux-arm-v1.29.7.tar.gz'; sha256='1052a0b2f96615e05690793ad658b41c72200256f6216d036a2643ca302c3005' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v1.29.7/syncthing-linux-arm64-v1.29.7.tar.gz'; sha256='ec2dbddabddb32783a70bd394b0b6cedc96129840fd2e7dee4e0a07ce3f5d468' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v1.29.7/syncthing-linux-ppc64le-v1.29.7.tar.gz'; sha256='aa0e8470d6784b52f19200ad517a789f7922d30616e252cf618aeb3d24502c39' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v1.29.7/syncthing-linux-riscv64-v1.29.7.tar.gz'; sha256='382d2723fc1b63542b50e963b0bcd18e91824493cfa14687d013d3b7953091ef' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v1.29.7/syncthing-linux-s390x-v1.29.7.tar.gz'; sha256='b2eb6630fb0ff121363de2171f9736761248e691a06d6d44ea2042668d12964b' ;; \
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
