FROM ruby:2.7-alpine

# alpineはsshが入っていないためインストール
# serverspec実行時にhighlineがないとエラーが発生するためインストール
RUN apk add --no-cache build-base && \
    apk add openssh && \
    gem install serverspec --no-document && \
    gem install highline --no-document