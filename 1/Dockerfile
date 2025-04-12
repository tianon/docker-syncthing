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
ENV SYNCTHING_VERSION 1.29.5

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v1.29.5/syncthing-linux-386-v1.29.5.tar.gz'; sha256='2e1953b2dbcc98d6795129a38d5b362dd8443c3ccd95eec34705ede2a3f7d6a8' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v1.29.5/syncthing-linux-amd64-v1.29.5.tar.gz'; sha256='b05cb12f6f58309612194cf1126b5ac090525e2c40e6bd64cc59b347dccbe441' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v1.29.5/syncthing-linux-arm-v1.29.5.tar.gz'; sha256='cc56c193a022de1b293eb44a93a76c9bff13c2d5839040146a2c2f8f15eafc86' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v1.29.5/syncthing-linux-arm-v1.29.5.tar.gz'; sha256='cc56c193a022de1b293eb44a93a76c9bff13c2d5839040146a2c2f8f15eafc86' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v1.29.5/syncthing-linux-arm64-v1.29.5.tar.gz'; sha256='c63885adb8c69e258b0315ed9ca7f32351554d7737536d38ed0a13d998d9da39' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v1.29.5/syncthing-linux-ppc64le-v1.29.5.tar.gz'; sha256='5484768bce4dd11529b610182d25d6c977aed071568aa833f2881954e9a252cc' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v1.29.5/syncthing-linux-riscv64-v1.29.5.tar.gz'; sha256='9b4894c33c3f81e40af2328773211070c014118a630af560430f10646306218f' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v1.29.5/syncthing-linux-s390x-v1.29.5.tar.gz'; sha256='dc856bcee03230195eabc8d255cbd0440f686b8385f6a32d159a5484f5c9de2d' ;; \
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
