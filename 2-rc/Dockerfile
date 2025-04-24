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
ENV SYNCTHING_VERSION 2.0.0-beta.11

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-beta.11/syncthing-linux-386-v2.0.0-beta.11.tar.gz'; sha256='57cd1f7ad4ed2fff08370fe9be4812d0cfcba9fca62ee4df0b940e8ec1a4cf21' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-beta.11/syncthing-linux-amd64-v2.0.0-beta.11.tar.gz'; sha256='fc27b2bbc0db3df6d649433428b5188ed0358faac9b4eb92f687d8725d506d04' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-beta.11/syncthing-linux-arm-v2.0.0-beta.11.tar.gz'; sha256='a0fee624e0dbc6dc02f3c90d3294af3b955f6c111c37f9bc9294ec37889c38e0' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-beta.11/syncthing-linux-arm-v2.0.0-beta.11.tar.gz'; sha256='a0fee624e0dbc6dc02f3c90d3294af3b955f6c111c37f9bc9294ec37889c38e0' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-beta.11/syncthing-linux-arm64-v2.0.0-beta.11.tar.gz'; sha256='2a86a41d973c8ef735d3c2121dd4dc879ed15406bd0925e90f6d62fc46285461' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-beta.11/syncthing-linux-ppc64le-v2.0.0-beta.11.tar.gz'; sha256='3bb9d2c25a690e030d6907a38f3cdca87e98e1bff7fb407222c82b3025d7d349' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-beta.11/syncthing-linux-riscv64-v2.0.0-beta.11.tar.gz'; sha256='2ebb5d1259484326b89b76af41c8081795b4d23eb301edef7f027ff8ca809f91' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-beta.11/syncthing-linux-s390x-v2.0.0-beta.11.tar.gz'; sha256='0014d6ba5f56cd3da5b67dbf52385015d09123d717ef4ff19f78489f41aa6afd' ;; \
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
