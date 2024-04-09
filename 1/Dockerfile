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
ENV SYNCTHING_VERSION 1.27.6

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v1.27.6/syncthing-linux-386-v1.27.6.tar.gz'; sha256='1c85bb66b1260b16141aa4a12edc487775ba98e93756249a7b7fd262c405f9a8' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.6/syncthing-linux-amd64-v1.27.6.tar.gz'; sha256='9ac221df8a8bcfcfec96fb3b2beb38cb123be818361b83c3c04988b949fafce0' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v1.27.6/syncthing-linux-arm-v1.27.6.tar.gz'; sha256='a7a2648165ac47787c06aa5c220ed95bd105d0cfbb62c80add31a95854752db6' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v1.27.6/syncthing-linux-arm-v1.27.6.tar.gz'; sha256='a7a2648165ac47787c06aa5c220ed95bd105d0cfbb62c80add31a95854752db6' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.6/syncthing-linux-arm64-v1.27.6.tar.gz'; sha256='ea5a7065c38dfedaadd19cf53db512e941a7c42ac5029384d6888ccb7a77aa73' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v1.27.6/syncthing-linux-ppc64le-v1.27.6.tar.gz'; sha256='8b5da54b92293fa0d3669523acb019cef54b669229d79e9d2436e8e7689f7219' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.6/syncthing-linux-riscv64-v1.27.6.tar.gz'; sha256='29c69b671773245de85f23dd7dc4fd6ff031bb26bd731f9b29d119c216e56f0a' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v1.27.6/syncthing-linux-s390x-v1.27.6.tar.gz'; sha256='8477d9f421db85471c5dc288d5a06d13b119b10092454c7ff31a7da785a008ad' ;; \
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
