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
ENV SYNCTHING_VERSION 1.29.4-rc.1

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v1.29.4-rc.1/syncthing-linux-386-v1.29.4-rc.1.tar.gz'; sha256='3255e09ddd4585e7bc098b8e73ff8f1653a61ff4911b23f7b2c2f79df86fb8ad' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v1.29.4-rc.1/syncthing-linux-amd64-v1.29.4-rc.1.tar.gz'; sha256='952cf34ea9850146504bc286ca35d7153578bb5cbfdd45809c4f532ec2fd3b21' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v1.29.4-rc.1/syncthing-linux-arm-v1.29.4-rc.1.tar.gz'; sha256='5ad72a4acdc452927a957413ea2300ce42a0f2b091b06fdc9fc1d2d8129a5aea' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v1.29.4-rc.1/syncthing-linux-arm-v1.29.4-rc.1.tar.gz'; sha256='5ad72a4acdc452927a957413ea2300ce42a0f2b091b06fdc9fc1d2d8129a5aea' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v1.29.4-rc.1/syncthing-linux-arm64-v1.29.4-rc.1.tar.gz'; sha256='964ff6bba942331939fdd1894582c2834d120570673b945d25780878a0d24d9c' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v1.29.4-rc.1/syncthing-linux-ppc64le-v1.29.4-rc.1.tar.gz'; sha256='3f509320daa1e5165dbfddaba7a3c92ce37b55250d20cedd446efee74de6cbe8' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v1.29.4-rc.1/syncthing-linux-riscv64-v1.29.4-rc.1.tar.gz'; sha256='7949a112576f0950a6398ce108fb708d3b22b8edc193812a2bbf02774c48f3d7' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v1.29.4-rc.1/syncthing-linux-s390x-v1.29.4-rc.1.tar.gz'; sha256='d351ecff394a3f930be95bce86cdbd9b097cd8e6d56f81cf78b96fdee3080582' ;; \
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
