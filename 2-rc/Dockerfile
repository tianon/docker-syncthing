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
ENV SYNCTHING_VERSION 2.0.0-rc.24

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.24/syncthing-linux-386-v2.0.0-rc.24.tar.gz'; sha256='701e5527b2b093900751f3cf4a8a7cde124a370aa81e8b5de1968beb9860dbcd' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.24/syncthing-linux-amd64-v2.0.0-rc.24.tar.gz'; sha256='eadf780f4257d64e5dbb38e5671b0b4c41d2fbffdabaaddba43c5aecd24847cb' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.24/syncthing-linux-arm-v2.0.0-rc.24.tar.gz'; sha256='27f78a5ac73c5572e5253422bc03b902f79fe5ce60d4a631c5e5714202cf82f9' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.24/syncthing-linux-arm-v2.0.0-rc.24.tar.gz'; sha256='27f78a5ac73c5572e5253422bc03b902f79fe5ce60d4a631c5e5714202cf82f9' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.24/syncthing-linux-arm64-v2.0.0-rc.24.tar.gz'; sha256='f20ed4e24bc9e187adac014241b059e20c51c6a7c180e3af36f3f20fa80e8594' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.24/syncthing-linux-ppc64le-v2.0.0-rc.24.tar.gz'; sha256='b4544f16d39650e32cccb61b2f2313349a3c7a4ddf9de0110334d43f5bf24bfa' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.24/syncthing-linux-riscv64-v2.0.0-rc.24.tar.gz'; sha256='d1e5538c9858301c7e3634a841f8543dd3518f109065da401645ea52403ca0fa' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-rc.24/syncthing-linux-s390x-v2.0.0-rc.24.tar.gz'; sha256='6d40408754a70a5f55e7b949e34f289f4af2379e2572c745b32b127701895014' ;; \
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
