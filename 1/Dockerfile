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
ENV SYNCTHING_VERSION 1.28.1

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v1.28.1/syncthing-linux-386-v1.28.1.tar.gz'; sha256='08f6ae89d3a6cf1b60cba1efb3ddc24230adde1f283fe96e60ce43f008bb2cb8' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v1.28.1/syncthing-linux-amd64-v1.28.1.tar.gz'; sha256='4b87d980d5ccfce6d5c8489e5793b2171b5d1cf89d9ea4f26bf3481f06d46ffa' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v1.28.1/syncthing-linux-arm-v1.28.1.tar.gz'; sha256='0c0d084d4e2eeaae9084f1c8e431c7e4fcad92c9fdc1eb711e44201e24561429' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v1.28.1/syncthing-linux-arm-v1.28.1.tar.gz'; sha256='0c0d084d4e2eeaae9084f1c8e431c7e4fcad92c9fdc1eb711e44201e24561429' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v1.28.1/syncthing-linux-arm64-v1.28.1.tar.gz'; sha256='272c0be3fa487a0ef9152396c13dbeb55cd8ff94a3c05578979c4406918e59a4' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v1.28.1/syncthing-linux-ppc64le-v1.28.1.tar.gz'; sha256='1b7a07af2b30c4f32541f81a29fc2309ff7e63dfc1848c2024650f92eea49029' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v1.28.1/syncthing-linux-riscv64-v1.28.1.tar.gz'; sha256='f056a4ea566588f7eeb09321e20afc67172fa0dd8f123adc0e516bbea1cd793c' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v1.28.1/syncthing-linux-s390x-v1.28.1.tar.gz'; sha256='815beecede61e502b79b990435462506bcf6b2bf6cc0ea03e835c154e5ea41ae' ;; \
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
