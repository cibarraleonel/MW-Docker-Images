#ssg: Static Site Generator
FROM ubuntu:18.04 AS ssg
RUN apt-get update && apt-get install -y curl tar git
WORKDIR /website-mikroways
RUN curl -sL https://github.com/gohugoio/hugo/releases/download/v0.122.0/hugo_extended_0.122.0_Linux-64bit.tar.gz \
| tar xzf - -C /usr/local/bin/
RUN git clone https://gitlab.com/mikroways/public/mikroways.net.git
WORKDIR /website-mikroways/mikroways.net
RUN hugo

#https://hub.docker.com/_/httpd
FROM httpd:alpine
COPY --from=ssg /website-mikroways/mikroways.net/public/ /usr/local/apache2/htdocs/