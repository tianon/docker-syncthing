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
ENV SYNCTHING_VERSION 1.27.2-rc.1

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v1.27.2-rc.1/syncthing-linux-386-v1.27.2-rc.1.tar.gz'; sha256='d63fda1aa9bbe99fc557354ded50cb869b1bcf45d076053646228cc968b6f098' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.2-rc.1/syncthing-linux-amd64-v1.27.2-rc.1.tar.gz'; sha256='bf89ceedf6ae22a09d034ea7ad5ab5465f9dee24d9d28aec378a1b48f31318b6' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v1.27.2-rc.1/syncthing-linux-arm-v1.27.2-rc.1.tar.gz'; sha256='b8782bf283a2e8a83819441fd8d4be5b6125976d66c724ee6e5e6df4d0e69ed6' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v1.27.2-rc.1/syncthing-linux-arm-v1.27.2-rc.1.tar.gz'; sha256='b8782bf283a2e8a83819441fd8d4be5b6125976d66c724ee6e5e6df4d0e69ed6' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.2-rc.1/syncthing-linux-arm64-v1.27.2-rc.1.tar.gz'; sha256='97777bcbf5c342209d182e5fb976cb1ce1ab5e553058d1e745423a4f4f000047' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v1.27.2-rc.1/syncthing-linux-ppc64le-v1.27.2-rc.1.tar.gz'; sha256='006de1a7aaedf78a3b9387ba71bf2c4a7da05cd653b07ac338549e71ccc230f6' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.2-rc.1/syncthing-linux-riscv64-v1.27.2-rc.1.tar.gz'; sha256='649d1af22799a28ac0b284661755688c92ea0b6f504f341e8eed942965de0bdf' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v1.27.2-rc.1/syncthing-linux-s390x-v1.27.2-rc.1.tar.gz'; sha256='541a607bb7f8876492b1a13d09346c74acc412bae474bebe38c28601d91eac8b' ;; \
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
