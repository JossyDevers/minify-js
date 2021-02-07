FROM node:12-alpine3.12
LABEL maintainer="devatherock@gmail.com"

RUN npm install -g minify@6.0.1 \
    &&  npm cache clean --force
RUN apk update \
	&& apk add --no-cache moreutils

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["sh", "/entrypoint.sh"]