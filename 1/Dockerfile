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
ENV SYNCTHING_VERSION 1.29.0

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v1.29.0/syncthing-linux-386-v1.29.0.tar.gz'; sha256='9b5a4804a8b228be16fe22e51b4653db65c264ef341a966e56d113ce0e9772c8' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v1.29.0/syncthing-linux-amd64-v1.29.0.tar.gz'; sha256='f7b120a92f0add1736a389e715a22a074e7bcdf96303dbe8229e0a06bfaba81d' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v1.29.0/syncthing-linux-arm-v1.29.0.tar.gz'; sha256='17872e32790635c9198f1c3509d84f340c4be84a76e77999cbe049f37947c6d6' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v1.29.0/syncthing-linux-arm-v1.29.0.tar.gz'; sha256='17872e32790635c9198f1c3509d84f340c4be84a76e77999cbe049f37947c6d6' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v1.29.0/syncthing-linux-arm64-v1.29.0.tar.gz'; sha256='b463134f986b630f871e990397a292b51ce49ef173aadc7f21ab438ea525c481' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v1.29.0/syncthing-linux-ppc64le-v1.29.0.tar.gz'; sha256='9b275e80ffd8af96b409f6ffc2030da60514b2db5444b767f0e61eda876d24f2' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v1.29.0/syncthing-linux-riscv64-v1.29.0.tar.gz'; sha256='c81da693ce2db66fabf134606bb238784e11b49105e9462f1abb0b41adc6dbb0' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v1.29.0/syncthing-linux-s390x-v1.29.0.tar.gz'; sha256='f38ce0bcb75dda0c02b1a660d7ecb99f9c2ed20ca5412310ac478c230ebea04f' ;; \
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
