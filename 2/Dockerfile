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
ENV SYNCTHING_VERSION 2.0.4

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v2.0.4/syncthing-linux-386-v2.0.4.tar.gz'; sha256='1f2076574aa8eb43ab29e4a708107866b05100e83396ea3d927bd9314fc8fb56' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.4/syncthing-linux-amd64-v2.0.4.tar.gz'; sha256='f8c33e8409f041af0663987214cd43e45908cf0792cfe9b0dd5352ae1d9e9895' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v2.0.4/syncthing-linux-arm-v2.0.4.tar.gz'; sha256='15778364956770db414a3af7f53a24523e0f7a89fd083918f1000e2cd4b2d4b1' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v2.0.4/syncthing-linux-arm-v2.0.4.tar.gz'; sha256='15778364956770db414a3af7f53a24523e0f7a89fd083918f1000e2cd4b2d4b1' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.4/syncthing-linux-arm64-v2.0.4.tar.gz'; sha256='6247412b61266394436fbdf8cc5a180c54b881c0ea88b2df9ca07227f4ceea60' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v2.0.4/syncthing-linux-ppc64le-v2.0.4.tar.gz'; sha256='d6e79bb7e6c3cd3761966e3f7802a7a064b218bdca666e8275a97ea19da44c20' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.4/syncthing-linux-riscv64-v2.0.4.tar.gz'; sha256='77eb59083a0816e76585f1dbb14314f416b3f320d4c57b556b7e1166fa38f32a' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v2.0.4/syncthing-linux-s390x-v2.0.4.tar.gz'; sha256='a3b019f64f0684a1b88fc773fd346f16574afc8547d18e742537f0d4f68430ac' ;; \
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
