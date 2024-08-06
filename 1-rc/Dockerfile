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
ENV SYNCTHING_VERSION 1.27.10-rc.1

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v1.27.10-rc.1/syncthing-linux-386-v1.27.10-rc.1.tar.gz'; sha256='a396e0a5cbf6a0fcb78c99e27558700b03c651d919025d317c42b06844ea045d' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.10-rc.1/syncthing-linux-amd64-v1.27.10-rc.1.tar.gz'; sha256='ab5150546a0277f029e9a0673d8b911bfa99df1f7946799825837cff77490bea' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v1.27.10-rc.1/syncthing-linux-arm-v1.27.10-rc.1.tar.gz'; sha256='208d46b912c98eeedc606e0c54fa2e24d8791c2c9b0066957ae07edd5443f5a3' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v1.27.10-rc.1/syncthing-linux-arm-v1.27.10-rc.1.tar.gz'; sha256='208d46b912c98eeedc606e0c54fa2e24d8791c2c9b0066957ae07edd5443f5a3' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.10-rc.1/syncthing-linux-arm64-v1.27.10-rc.1.tar.gz'; sha256='e11b6327303d7f476d976c5b8f1c20bc28997514e78df37f666f8861bea32246' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v1.27.10-rc.1/syncthing-linux-ppc64le-v1.27.10-rc.1.tar.gz'; sha256='b159681a52e495f7b5e9b69e151297cd3eabd6da524d4a5ea3dba056064865ed' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v1.27.10-rc.1/syncthing-linux-riscv64-v1.27.10-rc.1.tar.gz'; sha256='f480a3541b4dc5f300e49b0ff8d0b82ec7baa1449dd30ef35b0c367853db477e' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v1.27.10-rc.1/syncthing-linux-s390x-v1.27.10-rc.1.tar.gz'; sha256='42f444114eaba547bb4e5b58fa9f8da091c0507aa85ebc476c99e8216af80bca' ;; \
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
