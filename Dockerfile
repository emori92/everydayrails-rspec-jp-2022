FROM ruby:3.3.3

WORKDIR /everyday

RUN apt-get update -qq && \
  apt-get install -y build-essential libpq-dev nodejs && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

ADD Gemfile /everyday/Gemfile
ADD Gemfile.lock /everyday/Gemfile.lock
RUN bundle install

ADD . /everyday
