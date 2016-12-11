FROM cmosh/alpine-arm:3.4

MAINTAINER cmosh "cmosh@live.com"

# Install nginx
RUN apk add --update nginx && \
    rm -rf /var/cache/apk/* && \
    chown -R nginx:www-data /var/lib/nginx

# Add the files
ADD root /

# Expose the ports for nginx
EXPOSE 80 443