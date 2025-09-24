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
ENV SYNCTHING_VERSION 2.0.10

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v2.0.10/syncthing-linux-386-v2.0.10.tar.gz'; sha256='895106cfe72c0bd6f441d8c2ecfe172f7143d74370e91730cc7a54624ef38bff' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.10/syncthing-linux-amd64-v2.0.10.tar.gz'; sha256='3a7dcde0628bc0544121ff685fb4c39066a2d945c0080d9c69b47927347b253a' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v2.0.10/syncthing-linux-arm-v2.0.10.tar.gz'; sha256='b967c4d9ed2a88f7c718de39277638ee127bf46a4f2090c1e02e1bc41ed608f0' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v2.0.10/syncthing-linux-arm-v2.0.10.tar.gz'; sha256='b967c4d9ed2a88f7c718de39277638ee127bf46a4f2090c1e02e1bc41ed608f0' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.10/syncthing-linux-arm64-v2.0.10.tar.gz'; sha256='b91abba9595c3e37dade568d452d8d3195faab0d61dacff84bcc5d9948ad4da8' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v2.0.10/syncthing-linux-ppc64le-v2.0.10.tar.gz'; sha256='d9f1b688cc3082563a6a95fc875f0f3a6612f1912e5253aa1ba290272eb729a1' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.10/syncthing-linux-riscv64-v2.0.10.tar.gz'; sha256='5cc87e949afe6e581bccee14ddb98b6762993f7103805a2a1311cf96150dd65d' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v2.0.10/syncthing-linux-s390x-v2.0.10.tar.gz'; sha256='35e9ea77a41040631c993625e564820341b533d29a48a9e6d26ab579f41db900' ;; \
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
