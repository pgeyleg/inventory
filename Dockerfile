FROM ruby:2.5.5-alpine

ENV APP_ROOT /app/

RUN addgroup -S -g 1000 app && \
  adduser -S -D -u 1000 -G app -g app -s /sbin/nologin app

RUN apk add --no-cache build-base git 

RUN mkdir $APP_ROOT
WORKDIR $APP_ROOT

COPY . $APP_ROOT

RUN gem install bundler

ENV BUNDLE_PATH /app/bundle

RUN true && \
  bundle config jobs 2 && \
  bundle install

RUN mkdir -p tmp && \
  chown -R app:app tmp

USER app:app
