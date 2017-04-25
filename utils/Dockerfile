FROM alpine:3.5

RUN adduser -D user

RUN apk add --no-cache ca-certificates

RUN set -ex; \
	apk add --no-cache --virtual .temp-deps \
		libressl \
		tar \
	; \
	wget -O utils.tgz 'https://build.syncthing.net/job/syncthing-utils/lastSuccessfulBuild/artifact/src/github.com/syncthing/syncthing/utils-linux-amd64.tar.gz'; \
	tar -xvf utils.tgz -C /usr/local/bin/ --strip-components=1; \
	apk del .temp-deps; \
	rm utils.tgz

USER user
CMD ["stcli"]
