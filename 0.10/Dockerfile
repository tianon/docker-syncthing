FROM debian:jessie

RUN useradd --create-home user

RUN apt-get update && apt-get install -y ca-certificates --no-install-recommends && rm -rf /var/lib/apt/lists/*

# gpg: key 00654A3E: public key "Syncthing Release Management <release@syncthing.net>" imported
ENV SYNCTHING_GPG_KEY 37C84554E7E0A261E4F76E1ED26E6ED000654A3E

ENV SYNCTHING_VERSION 0.10.31

RUN set -x \
	&& apt-get update && apt-get install -y wget --no-install-recommends && rm -rf /var/lib/apt/lists/* \
	&& tarball="syncthing-linux-amd64-v${SYNCTHING_VERSION}.tar.gz" \
	&& wget \
		"http://archive.syncthing.net/v${SYNCTHING_VERSION}/$tarball" \
		"http://archive.syncthing.net/v${SYNCTHING_VERSION}/sha1sum.txt.asc" \
	&& export GNUPGHOME="$(mktemp -d)" \
	&& gpg --keyserver ha.pool.sks-keyservers.net --recv-keys "${SYNCTHING_GPG_KEY}" \
	&& gpg --batch --decrypt --output sha1sum.txt sha1sum.txt.asc \
	&& grep -E " ${tarball}\$" sha1sum.txt | sha1sum -c - \
	&& rm -r "$GNUPGHOME" sha1sum.txt sha1sum.txt.asc \
	&& dir="$(basename "$tarball" .tar.gz)" \
	&& bin="$dir/syncthing" \
	&& tar -xvzf "$tarball" "$bin" \
	&& rm "$tarball" \
	&& mv "$bin" /usr/local/bin/syncthing \
	&& rmdir "$dir" \
	&& apt-get purge -y --auto-remove wget

USER user
CMD ["syncthing"]
