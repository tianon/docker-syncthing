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
ENV SYNCTHING_VERSION 1.26.0-rc.2

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v1.26.0-rc.2/syncthing-linux-386-v1.26.0-rc.2.tar.gz'; sha256='e51d4c7cd70e6d9463ab74e7dfac508e6fea4bdd19188f6ae844d7d15fbe0a5c' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v1.26.0-rc.2/syncthing-linux-amd64-v1.26.0-rc.2.tar.gz'; sha256='c54bb95d61f67ced39a04cace0877e10af197d18a3a966d17828f8a15f38cd18' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v1.26.0-rc.2/syncthing-linux-arm-v1.26.0-rc.2.tar.gz'; sha256='21f3dca063d58c38e570f227ac11ab3efe8290989677e908cd02515b80ef6eb1' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v1.26.0-rc.2/syncthing-linux-arm-v1.26.0-rc.2.tar.gz'; sha256='21f3dca063d58c38e570f227ac11ab3efe8290989677e908cd02515b80ef6eb1' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v1.26.0-rc.2/syncthing-linux-arm64-v1.26.0-rc.2.tar.gz'; sha256='5896a0b95ee1c70356836f8d2218082a7d42eec875f677133d34387086d2d6b4' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v1.26.0-rc.2/syncthing-linux-ppc64le-v1.26.0-rc.2.tar.gz'; sha256='8fe1085f13a1a9854f505193703935edd918ea03ca39b196cc35f9f53c9c6bd8' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v1.26.0-rc.2/syncthing-linux-riscv64-v1.26.0-rc.2.tar.gz'; sha256='a645e23d87a6ab40230ff25c0bda0bda636964f3e87cf1cf2c157588392b4bf2' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v1.26.0-rc.2/syncthing-linux-s390x-v1.26.0-rc.2.tar.gz'; sha256='61c206655c9ad2df55bdf7beacb7ba8f6118d75a2fe47e7b0578a50730c70f4d' ;; \
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
