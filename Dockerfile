FROM ruby:2.2.1
MAINTAINER Rich Daley <rich@fishpercolator.co.uk>
ENV REFRESHED_AT 2015-06-02

RUN apt-get update -qq
RUN apt-get dist-upgrade -yqq 
RUN apt-get install -y build-essential libpq-dev
RUN apt-get install -y libqt4-dev libqt4-webkit xvfb
RUN gem install bundler

ENV APP_HOME /usr/src/jelly

RUN mkdir $APP_HOME
WORKDIR $APP_HOME
ADD Gemfile* $APP_HOME/

ENV BUNDLE_GEMFILE=$APP_HOME/Gemfile BUNDLE_JOBS=2 BUNDLE_PATH=/bundle

RUN bundle install

ADD . $APP_HOME

