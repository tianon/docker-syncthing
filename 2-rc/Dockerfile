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
ENV SYNCTHING_VERSION 2.1.7-rc.2

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v2.1.7-rc.2/syncthing-linux-386-v2.1.7-rc.2.tar.gz'; sha256='9734662df96e88dc86dbdcc56ebe6ad406ca70d5dd4fadcd9fc3868d5d932da1' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v2.1.7-rc.2/syncthing-linux-amd64-v2.1.7-rc.2.tar.gz'; sha256='f25e71781db9167fc1348b33ee4e0b5d18ff7bb2a442ab826829c8582576bc9e' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v2.1.7-rc.2/syncthing-linux-arm-v2.1.7-rc.2.tar.gz'; sha256='748df2900dc33e3b7e35f3a36783ff3c7b1f559f32f90b14591c2f57de082dc9' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v2.1.7-rc.2/syncthing-linux-arm-v2.1.7-rc.2.tar.gz'; sha256='748df2900dc33e3b7e35f3a36783ff3c7b1f559f32f90b14591c2f57de082dc9' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v2.1.7-rc.2/syncthing-linux-arm64-v2.1.7-rc.2.tar.gz'; sha256='aba1e61bba8946e34baa216fe8e7c7f912984266c4396155317fad99ae9296fe' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v2.1.7-rc.2/syncthing-linux-ppc64le-v2.1.7-rc.2.tar.gz'; sha256='23d6d6cc4a3e3fd928656edf91c0a164ffa3b93cb359cdbd53bd668050ee8074' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v2.1.7-rc.2/syncthing-linux-riscv64-v2.1.7-rc.2.tar.gz'; sha256='77ccd4703fec2eb04362fc06f7ef9221f5c3d632151c8e6322670931e279314a' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v2.1.7-rc.2/syncthing-linux-s390x-v2.1.7-rc.2.tar.gz'; sha256='cafdf8a15426f4dfd935f1aba69dc1682516bc689871ce53fafaa96fc89eafe0' ;; \
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
