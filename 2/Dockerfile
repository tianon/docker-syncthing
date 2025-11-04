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
ENV SYNCTHING_VERSION 2.0.11

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v2.0.11/syncthing-linux-386-v2.0.11.tar.gz'; sha256='cef31b6d22fb0cab04f89157685ade684901886b407d70771b87276e438223f9' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.11/syncthing-linux-amd64-v2.0.11.tar.gz'; sha256='b3390ff64518f19b55ff73eba113fad15e9dc5b394f76422f620f9c783ad44bb' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v2.0.11/syncthing-linux-arm-v2.0.11.tar.gz'; sha256='72e9ad8b750cbefcaed5f8d544f1c7cd98a16020b6c83e4b73e423a8079b7fe6' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v2.0.11/syncthing-linux-arm-v2.0.11.tar.gz'; sha256='72e9ad8b750cbefcaed5f8d544f1c7cd98a16020b6c83e4b73e423a8079b7fe6' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.11/syncthing-linux-arm64-v2.0.11.tar.gz'; sha256='9a7eacb14ee453c794b60ac4c2a934d420b2e8d61e99ea8753a1146b170f5a36' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v2.0.11/syncthing-linux-ppc64le-v2.0.11.tar.gz'; sha256='2adb2db2645206dcaef2fc78555ae328d868d9adcf29fceb3d33e74a4cc2329d' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.11/syncthing-linux-riscv64-v2.0.11.tar.gz'; sha256='6afc61797db0ab000bdc43421d7af66b00856de02d419437a443329619293134' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v2.0.11/syncthing-linux-s390x-v2.0.11.tar.gz'; sha256='ab463c9622d79ed1d25a0d780999faac8b4ba7d6f36c9bb140bc9a980e98570e' ;; \
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
