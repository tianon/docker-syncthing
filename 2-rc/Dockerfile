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
		'x86') url='https://github.com/syncthing/syncthing/releases/download/v2.0.11-rc.1/syncthing-linux-386-v2.0.11-rc.1.tar.gz'; sha256='567fc70a3476245e284665cb0c8b80709a030517c097bededd5d78cf5680ff08' ;; \
		'x86_64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.11-rc.1/syncthing-linux-amd64-v2.0.11-rc.1.tar.gz'; sha256='c6857de4b2918074da7b0abe5d0f9fdbddcabd27cfd5ba25bb5fea7f7871964f' ;; \
		'armhf') url='https://github.com/syncthing/syncthing/releases/download/v2.0.11-rc.1/syncthing-linux-arm-v2.0.11-rc.1.tar.gz'; sha256='5b2e32cd2b70022c9f93b313687a1a9647134cb2773bf088a84e9db2ea256735' ;; \
		'armv7') url='https://github.com/syncthing/syncthing/releases/download/v2.0.11-rc.1/syncthing-linux-arm-v2.0.11-rc.1.tar.gz'; sha256='5b2e32cd2b70022c9f93b313687a1a9647134cb2773bf088a84e9db2ea256735' ;; \
		'aarch64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.11-rc.1/syncthing-linux-arm64-v2.0.11-rc.1.tar.gz'; sha256='dca982d6625683c2e880f8146827cb968fdf09f9f9678b60f4f42504370ce23d' ;; \
		'ppc64le') url='https://github.com/syncthing/syncthing/releases/download/v2.0.11-rc.1/syncthing-linux-ppc64le-v2.0.11-rc.1.tar.gz'; sha256='b738eff86574ad1e10ea3afd374de56b0dacb2ee840ce10cb3db683404991bb7' ;; \
		'riscv64') url='https://github.com/syncthing/syncthing/releases/download/v2.0.11-rc.1/syncthing-linux-riscv64-v2.0.11-rc.1.tar.gz'; sha256='29eb966343168c6303ce15954d27d70256f11c57712f066bf250a8a0b26f4b12' ;; \
		's390x') url='https://github.com/syncthing/syncthing/releases/download/v2.0.11-rc.1/syncthing-linux-s390x-v2.0.11-rc.1.tar.gz'; sha256='5e77615d59b00d78029f8525ea49414d345fbd37587716cfda81b45ae70dc4f2' ;; \
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
