FROM ruby:2.5.7
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs default-mysql-client vim
RUN mkdir /FBP
WORKDIR /FBP
COPY Gemfile /FBP/Gemfile
COPY Gemfile.lock /FBP/Gemfile.lock
RUN bundle install
COPY . /FBP
