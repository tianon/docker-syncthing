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
ENV SYNCTHING_VERSION 2.0.0-beta.4

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-beta.4/syncthing-linux-386-v2.0.0-beta.4.tar.gz'; sha256='0fada7cf29393fcae4154a6deebfed21255caf0a4b89636939b3ab6a67f2d55b' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-beta.4/syncthing-linux-amd64-v2.0.0-beta.4.tar.gz'; sha256='cc5e116e2e2e07b3ba9aaf370c542e5f8c9d6ea9b020cb5ec260892e943b22d1' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-beta.4/syncthing-linux-arm-v2.0.0-beta.4.tar.gz'; sha256='c1ef37fe7a1123d6d8bbfa6ee2699c49283c63beaa77829304bbb1548b98fa3f' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-beta.4/syncthing-linux-arm-v2.0.0-beta.4.tar.gz'; sha256='c1ef37fe7a1123d6d8bbfa6ee2699c49283c63beaa77829304bbb1548b98fa3f' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-beta.4/syncthing-linux-arm64-v2.0.0-beta.4.tar.gz'; sha256='4dc6a107e1233c5d6c1c122832fb084e4648dfd29d84fc46f08721087988760b' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-beta.4/syncthing-linux-ppc64le-v2.0.0-beta.4.tar.gz'; sha256='e7e3f3a6baba28d54f1a20984422c2711ca717197740a18684bee6e246bd7181' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-beta.4/syncthing-linux-riscv64-v2.0.0-beta.4.tar.gz'; sha256='f90a956ec3eb6bbd5882dafc66c943575b7734aba81c3006c9693aeb0b8653e4' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-beta.4/syncthing-linux-s390x-v2.0.0-beta.4.tar.gz'; sha256='1dc53a62fa7fa522577cc5d386d3df9f0fd75afb183f20e55760e2082d5e5bd9' ;; \
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
