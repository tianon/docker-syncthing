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
ENV SYNCTHING_VERSION 1.25.0-rc.3

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v1.25.0-rc.3/syncthing-linux-386-v1.25.0-rc.3.tar.gz'; sha256='64c1428cb538c39dee419640e889fd4f86828a3ce849725fa26e5b941479cda7' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v1.25.0-rc.3/syncthing-linux-amd64-v1.25.0-rc.3.tar.gz'; sha256='7074ae75c00636c44d7fc8c249c9c10aa4b204fe6c1edaef6f3dd08fecbf6003' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v1.25.0-rc.3/syncthing-linux-arm-v1.25.0-rc.3.tar.gz'; sha256='a8ec193948a81c3941596ceb464454f1fce9834c712587ba351d3c22e2dc0d4e' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v1.25.0-rc.3/syncthing-linux-arm-v1.25.0-rc.3.tar.gz'; sha256='a8ec193948a81c3941596ceb464454f1fce9834c712587ba351d3c22e2dc0d4e' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v1.25.0-rc.3/syncthing-linux-arm64-v1.25.0-rc.3.tar.gz'; sha256='3787b03b23824066d707f08f2551077253035048ee456c9dbf8f4b563723ab7d' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v1.25.0-rc.3/syncthing-linux-ppc64le-v1.25.0-rc.3.tar.gz'; sha256='49302048de8b4a070218b726f627a75d9e16ca77feea6b83d296575d1fd32945' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v1.25.0-rc.3/syncthing-linux-riscv64-v1.25.0-rc.3.tar.gz'; sha256='95ce8fc26a7c181f5d941cb2b5d1879ea7c132c34e3e448e022801064a3faa59' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v1.25.0-rc.3/syncthing-linux-s390x-v1.25.0-rc.3.tar.gz'; sha256='5384439b2d45fa804a9e15701c5457006565ca92824e76a4aa97e268d4dc313e' ;; \
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
