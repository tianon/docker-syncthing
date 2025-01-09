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
ENV SYNCTHING_VERSION 1.29.1

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v1.29.1/syncthing-linux-386-v1.29.1.tar.gz'; sha256='27f9afa7b3e2007f20391e7130fdd8311aaeab7eec13974bb249ace0e012a590' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v1.29.1/syncthing-linux-amd64-v1.29.1.tar.gz'; sha256='d8f4bbecdb1b22af57f3b96b8c093c8f26baeb6a53e8ab21e25965885e77febf' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v1.29.1/syncthing-linux-arm-v1.29.1.tar.gz'; sha256='231bbc7fcd9a1105aeb7d7381099326dec324055e3a8b8bf59cb6ff3871436f0' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v1.29.1/syncthing-linux-arm-v1.29.1.tar.gz'; sha256='231bbc7fcd9a1105aeb7d7381099326dec324055e3a8b8bf59cb6ff3871436f0' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v1.29.1/syncthing-linux-arm64-v1.29.1.tar.gz'; sha256='08c13382609939ba819a3c082f2fe691c943903389f1a6b9eb8aa6ac7479aeb2' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v1.29.1/syncthing-linux-ppc64le-v1.29.1.tar.gz'; sha256='5cc44e5acdeb460470120c85faa404f4e50e628987333b62257015244878db70' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v1.29.1/syncthing-linux-riscv64-v1.29.1.tar.gz'; sha256='6a50a068f0f937462c36c1fdc67aeef8456200e990dd40230690d98747548180' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v1.29.1/syncthing-linux-s390x-v1.29.1.tar.gz'; sha256='bd86ff40259d73f18c3d153c28763d715f61218e34e28abb8515d3ca855aa3bd' ;; \
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
