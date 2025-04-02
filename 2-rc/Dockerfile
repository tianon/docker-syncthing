#
# NOTE: THIS DOCKERFILE IS GENERATED VIA "apply-templates.sh"
#
# PLEASE DO NOT EDIT IT DIRECTLY.
#

FROM alpine:3.21

RUN set -eux; \
	addgroup -g 1000 user; \
	adduser -u 1000 -G user -D user

# https://github.com/syncthing/syncthing/releases
ENV SYNCTHING_VERSION 2.0.0-beta.2

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-beta.2/syncthing-linux-386-v2.0.0-beta.2.tar.gz'; sha256='73e7f45870ab0461bfa12e1179f96d1c204b97afb0951b2e406339272ec2b789' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-beta.2/syncthing-linux-amd64-v2.0.0-beta.2.tar.gz'; sha256='46210ae30d15650c7efd31305eb832105f5ba57ccccb96e9384bcf94eccd5eae' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-beta.2/syncthing-linux-arm-v2.0.0-beta.2.tar.gz'; sha256='9b7529631ffa70f0870603a2fe09c75839cc162ecf92385bacb1e59a2b3c1f0c' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-beta.2/syncthing-linux-arm-v2.0.0-beta.2.tar.gz'; sha256='9b7529631ffa70f0870603a2fe09c75839cc162ecf92385bacb1e59a2b3c1f0c' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-beta.2/syncthing-linux-arm64-v2.0.0-beta.2.tar.gz'; sha256='d58e7eb6894c358e0fb8261b137445189b97c0e6ad68ae60958093ef4b0039b0' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-beta.2/syncthing-linux-ppc64le-v2.0.0-beta.2.tar.gz'; sha256='485fd645ae93b1a00ce8da34137f1a39f610757564b85e1a050bc90e1f451c46' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-beta.2/syncthing-linux-riscv64-v2.0.0-beta.2.tar.gz'; sha256='755bb09a813effb02b9fc6044bcf25b02b37b4e993dabd6fb64b7e99b8c54419' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v2.0.0-beta.2/syncthing-linux-s390x-v2.0.0-beta.2.tar.gz'; sha256='4435d44b4f37a8412507de2ebbe95d3d083fd75e788b20f3143f5730aa7c3d9c' ;; \
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
