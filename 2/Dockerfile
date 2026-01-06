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
ENV SYNCTHING_VERSION 2.0.13

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v2.0.13/syncthing-linux-386-v2.0.13.tar.gz'; sha256='b6b01e842a9b9e0e7d9daaf0738234bc4955632f18e8501164faf2195854e493' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.13/syncthing-linux-amd64-v2.0.13.tar.gz'; sha256='55ffe8a5deefc373c95a760ab71c3cbe77da493bb9bf426525d33c2fe22ead88' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v2.0.13/syncthing-linux-arm-v2.0.13.tar.gz'; sha256='0e2bc61796a053d01f7750e0967c5a120dfbbfeef5cca63eeaaee900af71b97b' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v2.0.13/syncthing-linux-arm-v2.0.13.tar.gz'; sha256='0e2bc61796a053d01f7750e0967c5a120dfbbfeef5cca63eeaaee900af71b97b' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.13/syncthing-linux-arm64-v2.0.13.tar.gz'; sha256='f62c7e85c081ea43c6e0c8a8bf428fb2f9c1be7f7d504fb214ddd4e1f056c36b' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v2.0.13/syncthing-linux-ppc64le-v2.0.13.tar.gz'; sha256='719ecf75dfe0ecd076cd17a8a357912009dc1df456dc3c4ab9fd18fc813dbb99' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.13/syncthing-linux-riscv64-v2.0.13.tar.gz'; sha256='e8bf1e359ac35aa530335ca723c960eecd5a09c7aff2e2f65bf3ac9bf4e9e542' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v2.0.13/syncthing-linux-s390x-v2.0.13.tar.gz'; sha256='70ef2d38319424a55fd4e72390a8e0102768e3b9bb287b30aa36730571dcae66' ;; \
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
