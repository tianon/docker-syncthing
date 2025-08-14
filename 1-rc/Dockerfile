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
ENV SYNCTHING_VERSION 1.30.0-rc.2

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v1.30.0-rc.2/syncthing-linux-386-v1.30.0-rc.2.tar.gz'; sha256='7f6ca563f92ae68b2820eee2bd4cb16acd7ee7988a494bb870f59318fc1cd6d0' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v1.30.0-rc.2/syncthing-linux-amd64-v1.30.0-rc.2.tar.gz'; sha256='3d30b649d0c33b0637dcbe1db8fc0c61a602e6b4d0fe8b19e386badb4a825b1d' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v1.30.0-rc.2/syncthing-linux-arm-v1.30.0-rc.2.tar.gz'; sha256='b673e0a8c093b33421a6f10f950fc2db94e4991bb46286ffb66bcb9ca5585840' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v1.30.0-rc.2/syncthing-linux-arm-v1.30.0-rc.2.tar.gz'; sha256='b673e0a8c093b33421a6f10f950fc2db94e4991bb46286ffb66bcb9ca5585840' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v1.30.0-rc.2/syncthing-linux-arm64-v1.30.0-rc.2.tar.gz'; sha256='c803c0f462e1affc36609bc33e0069d48c4161b6b772481ac321e5743df0721b' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v1.30.0-rc.2/syncthing-linux-ppc64le-v1.30.0-rc.2.tar.gz'; sha256='da4dba3f37aa62ffd212b68646810043a66872af5293d0ffcbca5230012d34be' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v1.30.0-rc.2/syncthing-linux-riscv64-v1.30.0-rc.2.tar.gz'; sha256='b5a4cf3523d519dc6e7ffa26cf93fb0970ddeb5db32474596bacf3a5371b5303' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v1.30.0-rc.2/syncthing-linux-s390x-v1.30.0-rc.2.tar.gz'; sha256='322af33887e063b25b3acf597003b44d105c4ed84474a03c18c8a279ebab6c8b' ;; \
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
