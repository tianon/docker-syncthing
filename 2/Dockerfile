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
ENV SYNCTHING_VERSION 2.0.3

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v2.0.3/syncthing-linux-386-v2.0.3.tar.gz'; sha256='12cebcba62c225ff8f7e2b4ee7a1396f253b26f090612d78def2047e64735c9f' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.3/syncthing-linux-amd64-v2.0.3.tar.gz'; sha256='55c251a9cc3a5ce713f36e8b917c550dcd83dcf6863cffe474db272d27748347' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v2.0.3/syncthing-linux-arm-v2.0.3.tar.gz'; sha256='8c28e3bf0bec0e78fc6f3035239e504f03cf451dd02970b278fc53e29c85c5a7' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v2.0.3/syncthing-linux-arm-v2.0.3.tar.gz'; sha256='8c28e3bf0bec0e78fc6f3035239e504f03cf451dd02970b278fc53e29c85c5a7' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.3/syncthing-linux-arm64-v2.0.3.tar.gz'; sha256='2241b472f72509d8da9180a77a6d5473651e8e4ca95b3a301050ab855ec12dbb' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v2.0.3/syncthing-linux-ppc64le-v2.0.3.tar.gz'; sha256='b5134bc2b404764f4b682c1e660bd3c0b218dd048fd0957ae0a00d5c4e9b21eb' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.3/syncthing-linux-riscv64-v2.0.3.tar.gz'; sha256='b69db077f8051e897a2b6381e0c9eceb2f76ab8e48b69c6f36de251d1fc5a2cb' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v2.0.3/syncthing-linux-s390x-v2.0.3.tar.gz'; sha256='c7d2bb300141fbe2f4b207304425d0b757792c30e20762cd0338cf60d56d62e9' ;; \
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
