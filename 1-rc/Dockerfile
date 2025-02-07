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
ENV SYNCTHING_VERSION 1.29.3-rc.1

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v1.29.3-rc.1/syncthing-linux-386-v1.29.3-rc.1.tar.gz'; sha256='6351a60395b7052e8cc51ad227c6cc6693f5585c228e7d7cb9aff386690fc826' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v1.29.3-rc.1/syncthing-linux-amd64-v1.29.3-rc.1.tar.gz'; sha256='4f7d8df766fc2d6bd3dd64191e40ce4fe32a70adb6701f0ea6e14995c085b487' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v1.29.3-rc.1/syncthing-linux-arm-v1.29.3-rc.1.tar.gz'; sha256='ab530e6be426473e8236e148c1815dc2549282ef66bae39b0fdd3d9442a34362' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v1.29.3-rc.1/syncthing-linux-arm-v1.29.3-rc.1.tar.gz'; sha256='ab530e6be426473e8236e148c1815dc2549282ef66bae39b0fdd3d9442a34362' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v1.29.3-rc.1/syncthing-linux-arm64-v1.29.3-rc.1.tar.gz'; sha256='d950320195168726178eaebb22fe5c206b786b19dcbfc7617c1256c5c159f96c' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v1.29.3-rc.1/syncthing-linux-ppc64le-v1.29.3-rc.1.tar.gz'; sha256='25504b4a2707ef39bd2c34d4f40c6e7b18f479f83afb2f144999f5ca289b8e46' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v1.29.3-rc.1/syncthing-linux-riscv64-v1.29.3-rc.1.tar.gz'; sha256='5e79c1ad70b6d1b5f6fd32fc3eaac207e72af1ffc579afb1c45bd98b444c0743' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v1.29.3-rc.1/syncthing-linux-s390x-v1.29.3-rc.1.tar.gz'; sha256='d61584a1bcfdf1b536026210d42b60f2b30ebe494c7db43eb6e81b0a06a1f36c' ;; \
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
