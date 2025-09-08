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
ENV SYNCTHING_VERSION 2.0.8

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v2.0.8/syncthing-linux-386-v2.0.8.tar.gz'; sha256='ba00826078d795da5f41d7fc8c54f39d7b8a1284f244f27c7dcc904366a05b06' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.8/syncthing-linux-amd64-v2.0.8.tar.gz'; sha256='a516ff64a1bf52b867016ecb069886b9db8d3126d49e58865b4c64d638523dc5' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v2.0.8/syncthing-linux-arm-v2.0.8.tar.gz'; sha256='1a3a5cd96d7ca07a21e62f1eb2ab9d31ea15ec2684f0bbdeb084c6e4b1bfdb64' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v2.0.8/syncthing-linux-arm-v2.0.8.tar.gz'; sha256='1a3a5cd96d7ca07a21e62f1eb2ab9d31ea15ec2684f0bbdeb084c6e4b1bfdb64' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.8/syncthing-linux-arm64-v2.0.8.tar.gz'; sha256='30c00ffd5a286d18d82ae262b02dac7f5a1592d3c5fa0c0c6986aa4621cc6ede' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v2.0.8/syncthing-linux-ppc64le-v2.0.8.tar.gz'; sha256='298805201b9823e16d106549a7a1ee4b68dd6eb605400bf5d4967e4edebb837d' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.8/syncthing-linux-riscv64-v2.0.8.tar.gz'; sha256='79749f5b39ea09943d4af6fddbcd6adace5e41845251754526066b8bf41ceaf8' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v2.0.8/syncthing-linux-s390x-v2.0.8.tar.gz'; sha256='71664ad3afb624d5d6e37ca38fd4802b85af97dfb22639bcf6dca53580777efd' ;; \
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
