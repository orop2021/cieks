FROM httpd
MAINTAINER os
COPY ./website /usr/local/apache2/htdocs/
EXPOSE 80
