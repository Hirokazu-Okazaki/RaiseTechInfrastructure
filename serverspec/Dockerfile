FROM ruby:2.7-alpine

ENV SERVERSPEC_VERSION 2.41.4

RUN apk add --no-cache build-base && \
    gem install serverspec -v ${SERVERSPEC_VERSION} --no-document