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
ENV SYNCTHING_VERSION 1.27.9

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v1.27.9/syncthing-linux-386-v1.27.9.tar.gz'; sha256='fc2e8abe5fbe7a15f575eec482da28178088f8352b5e02c9041bb460ec4a6164' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.9/syncthing-linux-amd64-v1.27.9.tar.gz'; sha256='590a3e0d85b06ac119b0b465f621a5f272d04a0de86a1b819ec0725f2a45b8fb' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v1.27.9/syncthing-linux-arm-v1.27.9.tar.gz'; sha256='e66b321b33f168ca096662a765e64908277315d18ea359232d198fd72c0fd74b' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v1.27.9/syncthing-linux-arm-v1.27.9.tar.gz'; sha256='e66b321b33f168ca096662a765e64908277315d18ea359232d198fd72c0fd74b' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.9/syncthing-linux-arm64-v1.27.9.tar.gz'; sha256='c511fef100acf43c0caa5de36bbe2ca617a7f0c44ee21cd1aba83609cbdf302c' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v1.27.9/syncthing-linux-ppc64le-v1.27.9.tar.gz'; sha256='40cd00b200b827a11b095465baa0d5d68a40b6e36524684f1f13b7e58f78d686' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.9/syncthing-linux-riscv64-v1.27.9.tar.gz'; sha256='2276aa73fba5df66b616bbd014f0f5fa1c4c23e4eabfe95d300b1361451b5b6b' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v1.27.9/syncthing-linux-s390x-v1.27.9.tar.gz'; sha256='744575e881707cfe99a2430e7b4e003ea2209c60fdf06da67537c728f67a6f79' ;; \
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
