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
ENV SYNCTHING_VERSION 1.29.6-rc.2

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v1.29.6-rc.2/syncthing-linux-386-v1.29.6-rc.2.tar.gz'; sha256='3c7c007eb195008b835fe68569ce947dbb461b53b6ea648a85658c0d3be53abd' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v1.29.6-rc.2/syncthing-linux-amd64-v1.29.6-rc.2.tar.gz'; sha256='a7c5ef933a0d4b971653875a06779267fdaaf258256987feefbc62984551b7f1' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v1.29.6-rc.2/syncthing-linux-arm-v1.29.6-rc.2.tar.gz'; sha256='be011166d151f63d406a0928c05313d1d6fb2ee3dac10c941dcf2b1952460727' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v1.29.6-rc.2/syncthing-linux-arm-v1.29.6-rc.2.tar.gz'; sha256='be011166d151f63d406a0928c05313d1d6fb2ee3dac10c941dcf2b1952460727' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v1.29.6-rc.2/syncthing-linux-arm64-v1.29.6-rc.2.tar.gz'; sha256='38cf4af45f44d93a67212f783f001c330762594d73e04181e0488c6e7b9c0c52' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v1.29.6-rc.2/syncthing-linux-ppc64le-v1.29.6-rc.2.tar.gz'; sha256='621522ec35dcbc2159a03700ad0802ed3849971be41cc837c541eb1a1bedf10c' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v1.29.6-rc.2/syncthing-linux-riscv64-v1.29.6-rc.2.tar.gz'; sha256='1a817a2cca5422af3108bdeb2b79e2c3df0dfbf418d43d47edc1ef8b6aa0334a' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v1.29.6-rc.2/syncthing-linux-s390x-v1.29.6-rc.2.tar.gz'; sha256='8ce8c8d1aff477af82f354f1a808352943cd8b1e08f437701dc99c35a681b95a' ;; \
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
