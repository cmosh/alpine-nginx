FROM cmosh/alpine-arm:3.2

RUN [ "cross-build-start" ]

RUN apk add --update nginx && rm -rf /var/cache/apk/*
RUN mkdir -p /tmp/nginx/client-body
RUN set -x ; \
  addgroup -g 82 -S nginx ; \
  adduser -u 82 -D -S -G nginx nginx && exit 0 ; exit 1

RUN [ "cross-build-end" ]

COPY nginx/nginx.conf /etc/nginx/nginx.conf
COPY nginx/default.conf /etc/nginx/conf.d/default.conf
COPY website /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]
