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
ENV SYNCTHING_VERSION 1.24.0

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v1.24.0/syncthing-linux-386-v1.24.0.tar.gz'; sha256='2a7a76bf499188226f0a74b35bb2a6e217dad025348c00dc79a7246cbd13ce28' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v1.24.0/syncthing-linux-amd64-v1.24.0.tar.gz'; sha256='b6e514d61f9be7d516483762e91e10c1644427e35d88c79edb64cbc6256e1036' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v1.24.0/syncthing-linux-arm-v1.24.0.tar.gz'; sha256='43060bdd6e0d3028749a505dfec2389730f30c7881ebbb76932d8a6f70558d68' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v1.24.0/syncthing-linux-arm-v1.24.0.tar.gz'; sha256='43060bdd6e0d3028749a505dfec2389730f30c7881ebbb76932d8a6f70558d68' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v1.24.0/syncthing-linux-arm64-v1.24.0.tar.gz'; sha256='e1e3de74b72794c1708e965a625dca04706745676148e0fa77fee2bbddfa49dd' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v1.24.0/syncthing-linux-ppc64le-v1.24.0.tar.gz'; sha256='67f0f2b8f5c6a4da401763bc6061f22c506d928954f07eb8ffe392693bda10c3' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v1.24.0/syncthing-linux-riscv64-v1.24.0.tar.gz'; sha256='06ea70fcdccdf2513650fb9556b54dc1fa974627cdcd51ca7b16e65a8b752e82' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v1.24.0/syncthing-linux-s390x-v1.24.0.tar.gz'; sha256='0be70aa19ee72c694ef2fa899407cc576ad1c2508938a6662e6a85c50edf3632' ;; \
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
