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
ENV SYNCTHING_VERSION 2.0.6

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v2.0.6/syncthing-linux-386-v2.0.6.tar.gz'; sha256='373bc366c44fa9874a0c59533b09f562429f738056235e99b2bd326b06781ba4' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.6/syncthing-linux-amd64-v2.0.6.tar.gz'; sha256='07a5f15b34d902ff6b4323e5db7b1210fb00162fa845e890ecda6038fd5e4ff2' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v2.0.6/syncthing-linux-arm-v2.0.6.tar.gz'; sha256='84435836a026390194917f160b36a2949f8ea0a500aaf4462a1a15093b129f7e' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v2.0.6/syncthing-linux-arm-v2.0.6.tar.gz'; sha256='84435836a026390194917f160b36a2949f8ea0a500aaf4462a1a15093b129f7e' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.6/syncthing-linux-arm64-v2.0.6.tar.gz'; sha256='ca9797b05f7f1f3c1c970619c8605778a3d1176ab8d6e6a0e25641e6e5012cef' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v2.0.6/syncthing-linux-ppc64le-v2.0.6.tar.gz'; sha256='eabd99d962ba103e58fd6f05cd4a2e2fffe4014afcb480dbf27f66776fd84add' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.6/syncthing-linux-riscv64-v2.0.6.tar.gz'; sha256='54dc6a14a93ee420797c305eb34e5557ef1ab741800a006b5ed7e6f5110ba6ba' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v2.0.6/syncthing-linux-s390x-v2.0.6.tar.gz'; sha256='f0fadef7a207619d6a819a859db7e8bb948e71b6ecc6a5995cfbdaefe2e818b5' ;; \
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
