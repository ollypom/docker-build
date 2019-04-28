FROM dtr.olly.dtcntr.net/prod/alpine:3.2
#FROM dtr.olly.dtcntr.net/prod/alpine:3.9

LABEL maintainer=olly@example.com

RUN apk add --update --no-cache nginx

RUN adduser -D -g 'www' www && \
    mkdir -p /www && \
    mkdir -p /run/nginx && \
    chown -R www:www /var/lib/nginx && \
    chown -R www:www /www

COPY myweb/nginx.conf /etc/nginx/nginx.conf
COPY myweb/index.html /www/index.html
COPY myweb/logo.png /www/logo.png

USER nobody
HEALTHCHECK --interval=5m --timeout=3s CMD curl --fail http://localhost/ || exit 1

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
