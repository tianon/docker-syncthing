#
# NOTE: THIS DOCKERFILE IS GENERATED VIA "apply-templates.sh"
#
# PLEASE DO NOT EDIT IT DIRECTLY.
#

FROM alpine:3.22

RUN set -eux; \
	addgroup -g 1000 user; \
	adduser -u 1000 -G user -D user

# https://github.com/syncthing/syncthing/releases
ENV SYNCTHING_VERSION 2.1.0

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v2.1.0/syncthing-linux-386-v2.1.0.tar.gz'; sha256='0ecd504b5186108d79af6d928c4bb6a98eceb87a3af27c22b1d6dbcb1e0fdd85' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v2.1.0/syncthing-linux-amd64-v2.1.0.tar.gz'; sha256='624c2f3303c9ed7d6f27a98ad9767ab95a7b5e453c3c5e17ce8a60f166e47011' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v2.1.0/syncthing-linux-arm-v2.1.0.tar.gz'; sha256='dfcccf4855628d6b1de483a4a777c029121ee4e7cbc04ea76e26aee47dd20578' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v2.1.0/syncthing-linux-arm-v2.1.0.tar.gz'; sha256='dfcccf4855628d6b1de483a4a777c029121ee4e7cbc04ea76e26aee47dd20578' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v2.1.0/syncthing-linux-arm64-v2.1.0.tar.gz'; sha256='6740739c46342a7b25104772822ba958b8933ed625b40e859a51dedfb9dfdad2' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v2.1.0/syncthing-linux-ppc64le-v2.1.0.tar.gz'; sha256='35d80d1c335c7f208b0be3fb851959b98004beb6227a295f07a18de189294c34' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v2.1.0/syncthing-linux-riscv64-v2.1.0.tar.gz'; sha256='164d3cfe28de732e3236eee2a3790d795e166cc83c17da91dd1ecb310a73e0fb' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v2.1.0/syncthing-linux-s390x-v2.1.0.tar.gz'; sha256='dd49dd1b6485fb91509d72ef19322248a1a3c2666510051d729da60ada188021' ;; \
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
