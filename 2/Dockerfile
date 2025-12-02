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
ENV SYNCTHING_VERSION 2.0.12

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v2.0.12/syncthing-linux-386-v2.0.12.tar.gz'; sha256='0998ebbba589ec56b455b55b71bf6493bbd1169a653b4a54dce1afbddc2db7b7' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.12/syncthing-linux-amd64-v2.0.12.tar.gz'; sha256='a096082e9fff4c7b4884aab95b53afd0177316de544d517dd1fc7fe47d4ea4c3' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v2.0.12/syncthing-linux-arm-v2.0.12.tar.gz'; sha256='9845057b018ecda90f125bd17ac310e2b57e9ba86dbb05f09a2fc5ac5cf2adc3' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v2.0.12/syncthing-linux-arm-v2.0.12.tar.gz'; sha256='9845057b018ecda90f125bd17ac310e2b57e9ba86dbb05f09a2fc5ac5cf2adc3' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.12/syncthing-linux-arm64-v2.0.12.tar.gz'; sha256='ca6d1c6432c081c374dd023e3e4c80008e8895ff284cd105ed8e5a1cb380ef4e' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v2.0.12/syncthing-linux-ppc64le-v2.0.12.tar.gz'; sha256='f6c222d6fc34032b2caca8ac8a55ea5840603334068a0cd1026496a0e9a7d67a' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.12/syncthing-linux-riscv64-v2.0.12.tar.gz'; sha256='bde31866f3c24f1da55c7842547f4f5d9dde92905eb9a98008e46412253e3a56' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v2.0.12/syncthing-linux-s390x-v2.0.12.tar.gz'; sha256='40d4162d3efaffb3c617932bfe74826d00a703cdb49da6583653ff04e619c84a' ;; \
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
