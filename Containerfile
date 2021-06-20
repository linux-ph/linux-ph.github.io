FROM docker.io/library/alpine:latest

EXPOSE 4000/tcp
EXPOSE 35729/tcp

RUN apk --update-cache upgrade
RUN apk add libstdc++
RUN rm /var/cache/apk/*
ADD [ "ruby-3.0.1-jekyll.tar.gz", "/" ]

VOLUME [ "/var/www" ]
WORKDIR /var/www

ENTRYPOINT [ "/usr/local/bin/jekyll" ]
CMD [ "server", "--host", "0.0.0.0", "--livereload" ]
