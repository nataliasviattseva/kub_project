FROM  centos:latest as build
MAINTAINER natalia.sviattseva@gmail.com
RUN yum install -y httpd \
 zip\
 unzip
RUN yum update -y
# COPY https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/
RUN curl https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip \
  | tar -xjC /var/www/html/ photogenic.zip
WORKDIR /var/www/html/
RUN unzip photogenic.zip
RUN cp -rvf photogenic/* .
RUN rm -rf photogenic photogenic.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80 22
