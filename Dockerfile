FROM cmosh/alpine-arm:3.4

RUN [ "cross-build-start" ]

RUN apk add --update nginx && rm -rf /var/cache/apk/* \
    && mkdir -p /tmp/nginx/client-body \
    && set -x ; \
    addgroup -g 95 -S nginx ; \
    adduser -u 95 -D -S -G nginx nginx && exit 0 ; exit 1

RUN [ "cross-build-end" ]

COPY /root /etc/nginx

CMD ["nginx", "-g", "daemon off;"]
