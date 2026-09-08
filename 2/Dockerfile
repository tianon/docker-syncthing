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
ENV SYNCTHING_VERSION 2.1.5

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v2.1.5/syncthing-linux-386-v2.1.5.tar.gz'; sha256='f8bb9f6714876b3bc3004ff09c70fc42fcf8884cf60ed10231ce131c9e0f0df0' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v2.1.5/syncthing-linux-amd64-v2.1.5.tar.gz'; sha256='3d222b609f7ab2944e02748cb10488b4160d446b49e0eafc107ef2a525ab3486' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v2.1.5/syncthing-linux-arm-v2.1.5.tar.gz'; sha256='bb328aa18f70545b91cfa91c88416bec9d11de3500cbc63315d6fcd670ce6076' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v2.1.5/syncthing-linux-arm-v2.1.5.tar.gz'; sha256='bb328aa18f70545b91cfa91c88416bec9d11de3500cbc63315d6fcd670ce6076' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v2.1.5/syncthing-linux-arm64-v2.1.5.tar.gz'; sha256='3666f3069feeee3651e185f867759206059755101797bdd69ea5317610130855' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v2.1.5/syncthing-linux-ppc64le-v2.1.5.tar.gz'; sha256='d5692986a2cd4e7935747fe9ae7f440f341145204dd3d200b0fea3a624ed6d43' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v2.1.5/syncthing-linux-riscv64-v2.1.5.tar.gz'; sha256='de7b19328f37b466456ff33950bcea03c6696425db96ca7b2c48002040f4ef4c' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v2.1.5/syncthing-linux-s390x-v2.1.5.tar.gz'; sha256='d6adfddef8f4f15137f7929bd8cbe121097aa3a2e0d68b5947024a04bd1f5665' ;; \
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
