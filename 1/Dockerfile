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
ENV SYNCTHING_VERSION 1.30.0

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v1.30.0/syncthing-linux-386-v1.30.0.tar.gz'; sha256='b2a2aa177f189c3a9c9a9c0d6dbac60053a7af8122be124b3e8dfbf0c028f268' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v1.30.0/syncthing-linux-amd64-v1.30.0.tar.gz'; sha256='a2edc833d6dd71a76b7c481dbcc81f8be37da9eb83993c512bf53eb096ba7a73' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v1.30.0/syncthing-linux-arm-v1.30.0.tar.gz'; sha256='70beb4c43a752d3b11a780bf2ca2d1a3b50f9f74e0b6a9cd35b7f204fea375e1' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v1.30.0/syncthing-linux-arm-v1.30.0.tar.gz'; sha256='70beb4c43a752d3b11a780bf2ca2d1a3b50f9f74e0b6a9cd35b7f204fea375e1' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v1.30.0/syncthing-linux-arm64-v1.30.0.tar.gz'; sha256='4655e260e94fa5e0110084040751bd0274acdeb74653933f909036e788a911a1' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v1.30.0/syncthing-linux-ppc64le-v1.30.0.tar.gz'; sha256='4d268279081414db01ff2e80018f51f165803e9052d07505850faeaf2dd5a616' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v1.30.0/syncthing-linux-riscv64-v1.30.0.tar.gz'; sha256='170eaadbd869df28f0f6d07d7eced5b52c8b0dedf7583d944690b77b384e81a9' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v1.30.0/syncthing-linux-s390x-v1.30.0.tar.gz'; sha256='6f76af9e3ff14f0a7ac9a8ea6a57e0a391ef08ecd23c9eae6a057a17edf91568' ;; \
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
