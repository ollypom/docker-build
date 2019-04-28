FROM dtr.olly.dtcntr.net/prod/alpine:3.9

LABEL maintainer=olly@example.com

RUN apk add --update --no-cache curl nginx

RUN adduser -D -g 'www' www && \
    mkdir -p /www && \
    mkdir -p /run/nginx && \
    mkdir -p /var/log/nginx && \
    chown -R www:www /var/lib/nginx && \
    chown -R www:www /www && \
    chown -R www:www /var/log/nginx

COPY myweb/nginx.conf /etc/nginx/nginx.conf
COPY myweb/index.html /www/index.html
COPY myweb/logo.png /www/logo.png

USER www

HEALTHCHECK --interval=30s --timeout=3s CMD curl --fail http://localhost:8080/ || exit 1

EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]
