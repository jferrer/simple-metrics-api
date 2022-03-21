FROM ruby:3.0
LABEL Description="Docker Rails API Base"
WORKDIR /api

RUN gem install bundler

CMD exec bin/start.sh
