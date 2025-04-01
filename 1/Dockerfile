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
ENV SYNCTHING_VERSION 1.29.4

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v1.29.4/syncthing-linux-386-v1.29.4.tar.gz'; sha256='a49f3c36e04cfd580f6d4ae6db60ea2ac8878a2bb3a4a742237369c18d4470c1' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v1.29.4/syncthing-linux-amd64-v1.29.4.tar.gz'; sha256='e8e6a66829dd8138b16298262c4242e313622a2f7cf18d4c0f3346ea4cb9ce5d' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v1.29.4/syncthing-linux-arm-v1.29.4.tar.gz'; sha256='f069c8af64a56c38d4de8a80a4a66e157c783c2db7eccdd4c6f09e303a96f732' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v1.29.4/syncthing-linux-arm-v1.29.4.tar.gz'; sha256='f069c8af64a56c38d4de8a80a4a66e157c783c2db7eccdd4c6f09e303a96f732' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v1.29.4/syncthing-linux-arm64-v1.29.4.tar.gz'; sha256='6245c28a3076e923285d3fe08dc9a961b0063ce97f8651997053a47bc65f7db8' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v1.29.4/syncthing-linux-ppc64le-v1.29.4.tar.gz'; sha256='9ac41eb6ca0c9dce87cf9999703a924a91883612a6e7f9dbe65788add1e48661' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v1.29.4/syncthing-linux-riscv64-v1.29.4.tar.gz'; sha256='77c349ac472e64ee2c4a3e8d6ce5504d844bc7f3cc4f0ac54f096519156d83f7' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v1.29.4/syncthing-linux-s390x-v1.29.4.tar.gz'; sha256='eed0dc8eea67af65c87a2774cad10fd5ac24037a049726faea43f46168729157' ;; \
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
