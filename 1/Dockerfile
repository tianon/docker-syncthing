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
ENV SYNCTHING_VERSION 1.27.10

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v1.27.10/syncthing-linux-386-v1.27.10.tar.gz'; sha256='bd6293f9c7b407f991a3e597e690229f09c22a9d5d033a956cf3e3412a132dc6' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.10/syncthing-linux-amd64-v1.27.10.tar.gz'; sha256='c04ffbdedcd1d18ccb4a34a341a6a2b2461082f7a6f43537eb0bba860975fd60' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v1.27.10/syncthing-linux-arm-v1.27.10.tar.gz'; sha256='eb32041e381986e791f5748b2052b21799f39ffb2c85b7fab03edf45e2c68400' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v1.27.10/syncthing-linux-arm-v1.27.10.tar.gz'; sha256='eb32041e381986e791f5748b2052b21799f39ffb2c85b7fab03edf45e2c68400' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.10/syncthing-linux-arm64-v1.27.10.tar.gz'; sha256='dc4a6dff2a94bde4b477c3c28fa300fba2a5e267893cd7758d4961dfeff6e31a' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v1.27.10/syncthing-linux-ppc64le-v1.27.10.tar.gz'; sha256='746df73369c97d09d541a759590fe70255d02cf4fb10d2d74cc46d845764b3f7' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.10/syncthing-linux-riscv64-v1.27.10.tar.gz'; sha256='f787a01b44db4a6f726e5d7ffca670d4465e121b87bbb52f0a48ad5b5da13284' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v1.27.10/syncthing-linux-s390x-v1.27.10.tar.gz'; sha256='b74e4afc23c863e8a9b75757341b34cbf4fe9cec354a7f9e44dac3b63d861c16' ;; \
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
