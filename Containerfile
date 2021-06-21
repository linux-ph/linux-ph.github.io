FROM docker.io/library/ruby:alpine

ARG JEKYLL_ARCHIVE="ruby-3.0.1-jekyll.tar.gz"

EXPOSE 4000/tcp
EXPOSE 35729/tcp

RUN apk --update-cache upgrade
ADD [ "${JEKYLL_ARCHIVE}", "/" ]
RUN rm -r /var/cache/apk/* /usr/local/lib/ruby/gems/3.0.0/cache

VOLUME [ "/var/www" ]
WORKDIR /var/www

ENTRYPOINT [ "/usr/local/bundle/bin/jekyll" ]
CMD [ "server", "--host", "0.0.0.0", "--livereload" ]
