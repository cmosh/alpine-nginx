FROM cmosh/alpine-arm:3.4

MAINTAINER cmosh "cmosh@live.com"

# Install nginx
RUN [ "cross-build-start" ]

RUN apk add --update nginx && \
    rm -rf /var/cache/apk/* 

RUN [ "cross-build-end" ]  

# Add the files
ADD root /

# Expose the ports for nginx
EXPOSE 80 443