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
ENV SYNCTHING_VERSION 2.1.7-rc.1

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v2.1.7-rc.1/syncthing-linux-386-v2.1.7-rc.1.tar.gz'; sha256='1d96a75f0de7a7227094aa1984fa160c2c7419097ec6fc662b5fbdfc4db409fa' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v2.1.7-rc.1/syncthing-linux-amd64-v2.1.7-rc.1.tar.gz'; sha256='9f76d102f2161dafe0cadb3c82f5bceebfa0305f6c3879259ef3cbd1d391e24e' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v2.1.7-rc.1/syncthing-linux-arm-v2.1.7-rc.1.tar.gz'; sha256='fb307a9e09b8ed9b5f24af8b8ea167b2c3162a63feef529542fab29dab76b65b' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v2.1.7-rc.1/syncthing-linux-arm-v2.1.7-rc.1.tar.gz'; sha256='fb307a9e09b8ed9b5f24af8b8ea167b2c3162a63feef529542fab29dab76b65b' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v2.1.7-rc.1/syncthing-linux-arm64-v2.1.7-rc.1.tar.gz'; sha256='3e8d592e8e642201a2cacffbd76ec144a8981260f0622020add953d413e924f7' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v2.1.7-rc.1/syncthing-linux-ppc64le-v2.1.7-rc.1.tar.gz'; sha256='3c194f1602f45dbe3a84d5c3d5b4cd4f7a6a5a87bfd392d140fb131d873c7765' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v2.1.7-rc.1/syncthing-linux-riscv64-v2.1.7-rc.1.tar.gz'; sha256='17f88d9ef59bd81e77de0d4bddeb13036bc95507cd23fb9a1d392aecdbce0036' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v2.1.7-rc.1/syncthing-linux-s390x-v2.1.7-rc.1.tar.gz'; sha256='adfae53a7c40b00259b928a083d7e14c952004578f86730e7482b581d6fbd2a3' ;; \
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
