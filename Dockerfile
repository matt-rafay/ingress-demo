FROM nginxinc/nginx-unprivileged:alpine

LABEL maintainer="matt-rafay <91474568+matt-rafay@users.noreply.github.com>"

COPY assets /usr/share/nginx
COPY nginx/certs /etc/nginx/certs
COPY nginx/conf.d /etc/nginx/conf.d
COPY nginx/nginx.conf /etc/nginx/nginx.conf

USER root

RUN set -x \
	&& chown -R 101:0 /etc/nginx

EXPOSE 8080 8443

USER 101

CMD ["nginx", "-g", "daemon off;"]
