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
ENV SYNCTHING_VERSION 2.1.7-rc.4

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v2.1.7-rc.4/syncthing-linux-386-v2.1.7-rc.4.tar.gz'; sha256='8569f968491d4e7a16c96f5a8ec595274973e959477b4919b9c26b1a225b0daa' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v2.1.7-rc.4/syncthing-linux-amd64-v2.1.7-rc.4.tar.gz'; sha256='3dccbdd688a38983deba7b81cf4ee2bf9b1d8722e3eab37403cf65f4eb52bc3e' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v2.1.7-rc.4/syncthing-linux-arm-v2.1.7-rc.4.tar.gz'; sha256='ad35cd2e89dddf736e85fc96713feedebea92ebcac7099c68288d3043f3e7afc' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v2.1.7-rc.4/syncthing-linux-arm-v2.1.7-rc.4.tar.gz'; sha256='ad35cd2e89dddf736e85fc96713feedebea92ebcac7099c68288d3043f3e7afc' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v2.1.7-rc.4/syncthing-linux-arm64-v2.1.7-rc.4.tar.gz'; sha256='c0d2f401f8cd5e2e43959f72b31c1c6a9dd6f2c9f468ba4ca8f8915c1c56e889' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v2.1.7-rc.4/syncthing-linux-ppc64le-v2.1.7-rc.4.tar.gz'; sha256='74f3b956be5f7d60067b589ea424bbc25c17e18531fb1452731ea90e9dea8940' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v2.1.7-rc.4/syncthing-linux-riscv64-v2.1.7-rc.4.tar.gz'; sha256='b09d8fa07486e642a668c0cf2944963a21e84faf4c5cbe7533b50469374d7c79' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v2.1.7-rc.4/syncthing-linux-s390x-v2.1.7-rc.4.tar.gz'; sha256='e0ce5d9dac3be1c40dd39a00be50155d77ac3d5395d5f54fbafdefe2138eacfd' ;; \
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
