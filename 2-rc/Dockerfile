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
ENV SYNCTHING_VERSION 2.0.11-rc.1

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v2.0.11-rc.1/syncthing-linux-386-v2.0.11-rc.1.tar.gz'; sha256='70c5181e15484ed8371d579d62d4ebd79d58c855fe6dc269f431c4e8ae872bc6' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.11-rc.1/syncthing-linux-amd64-v2.0.11-rc.1.tar.gz'; sha256='9f71a0989f26ade9ec83ab2b6a9313fd29243073764ac8f7cd94a1e39941de27' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v2.0.11-rc.1/syncthing-linux-arm-v2.0.11-rc.1.tar.gz'; sha256='ae3bcfa7ad8b22c5d780bfeae6af100d7b86b82a7ef7ce7cbbccf64a7545bf3f' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v2.0.11-rc.1/syncthing-linux-arm-v2.0.11-rc.1.tar.gz'; sha256='ae3bcfa7ad8b22c5d780bfeae6af100d7b86b82a7ef7ce7cbbccf64a7545bf3f' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.11-rc.1/syncthing-linux-arm64-v2.0.11-rc.1.tar.gz'; sha256='e4c1799a9cdbabee23d08956d8af7ebc60469c33455eccfd0e9b9cabcadef4a1' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v2.0.11-rc.1/syncthing-linux-ppc64le-v2.0.11-rc.1.tar.gz'; sha256='6e4b4cc3d5d524c92bce7070e5f3679f6d37f6c70529b4a851a65330006c0734' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.11-rc.1/syncthing-linux-riscv64-v2.0.11-rc.1.tar.gz'; sha256='573fd87e9415ca668f4d5c3ef84ce44941a863c046ddc73939b746c329f1ba90' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v2.0.11-rc.1/syncthing-linux-s390x-v2.0.11-rc.1.tar.gz'; sha256='efea84379eba7458a0cfecb2eeac55814830714e8fcc4da8145e5640b9c88fbf' ;; \
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
