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
ENV SYNCTHING_VERSION 2.0.12-rc.1

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v2.0.12-rc.1/syncthing-linux-386-v2.0.12-rc.1.tar.gz'; sha256='c62d71a8441c80c72e3398e0754cdd1af42b258daaca315a3cb5a6e63601bedb' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.12-rc.1/syncthing-linux-amd64-v2.0.12-rc.1.tar.gz'; sha256='4d56979534efa7c0e7f5fdd96836097b93d50326620c2954febdb84006886465' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v2.0.12-rc.1/syncthing-linux-arm-v2.0.12-rc.1.tar.gz'; sha256='a65de03377c574bbd3aa021e7224e04ab8ceeb4589bdc92cade32de82c451353' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v2.0.12-rc.1/syncthing-linux-arm-v2.0.12-rc.1.tar.gz'; sha256='a65de03377c574bbd3aa021e7224e04ab8ceeb4589bdc92cade32de82c451353' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.12-rc.1/syncthing-linux-arm64-v2.0.12-rc.1.tar.gz'; sha256='d3a4b526ef77d7a9cdcb2d80901350188f9571a2ddbbea95b3a344d89b152b25' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v2.0.12-rc.1/syncthing-linux-ppc64le-v2.0.12-rc.1.tar.gz'; sha256='eefe3c9194c0f2f8f50f510bd3e04af4ac87cf727e19ad833e7a43da53e7762c' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.12-rc.1/syncthing-linux-riscv64-v2.0.12-rc.1.tar.gz'; sha256='49ff172ffc924df5f6e0717469324f5d1c25e2cee77baf656b1397b02c920b1f' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v2.0.12-rc.1/syncthing-linux-s390x-v2.0.12-rc.1.tar.gz'; sha256='06fbc9196c889472b962a25526abc7fd2539526cef0fb79142073fef4dcee7fa' ;; \
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
