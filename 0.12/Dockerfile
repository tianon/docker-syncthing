FROM alpine:3.2

RUN adduser -D user

RUN apk add --update ca-certificates && rm -rf /var/cache/apk/*

# gpg: key 00654A3E: public key "Syncthing Release Management <release@syncthing.net>" imported
ENV SYNCTHING_GPG_KEY 37C84554E7E0A261E4F76E1ED26E6ED000654A3E

ENV SYNCTHING_VERSION 0.12.8

RUN set -x \
	&& installDeps='gnupg' \
	&& apk add --update $installDeps && rm -rf /var/cache/apk/* \
	&& gpg --keyserver pool.sks-keyservers.net --recv-keys "${SYNCTHING_GPG_KEY}" \
	&& tarball="syncthing-linux-amd64-v${SYNCTHING_VERSION}.tar.gz" \
	&& wget \
		"https://github.com/syncthing/syncthing/releases/download/v${SYNCTHING_VERSION}/$tarball" \
		"https://github.com/syncthing/syncthing/releases/download/v${SYNCTHING_VERSION}/sha1sum.txt.asc" \
	&& gpg --verify sha1sum.txt.asc \
	&& grep -E " ${tarball}\$" sha1sum.txt.asc | sha1sum -c - \
	&& rm sha1sum.txt.asc \
	&& dir="$(basename "$tarball" .tar.gz)" \
	&& bin="$dir/syncthing" \
	&& tar -xvzf "$tarball" "$bin" \
	&& rm "$tarball" \
	&& mv "$bin" /usr/local/bin/syncthing \
	&& rmdir "$dir" \
	&& apk del $installDeps \
	&& rm -r ~/.gnupg

USER user
CMD ["syncthing"]
