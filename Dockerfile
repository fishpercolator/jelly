FROM ruby:2.2.1
MAINTAINER Rich Daley <rich@fishpercolator.co.uk>
ENV REFRESHED_AT 2015-06-10

RUN apt-get update -qq
RUN apt-get dist-upgrade -yqq

ADD http://ftp.uk.debian.org/debian/pool/main/p/phantomjs/phantomjs_1.9.0-1+b1_amd64.deb /tmp/
RUN dpkg -i /tmp/phantomjs_1.9.0-1+b1_amd64.deb
RUN gem install bundler

ENV APP_HOME /usr/src/jelly

RUN mkdir $APP_HOME
WORKDIR $APP_HOME
ADD Gemfile* $APP_HOME/

ENV BUNDLE_GEMFILE=$APP_HOME/Gemfile BUNDLE_JOBS=2 BUNDLE_PATH=/bundle

RUN bundle install

ADD . $APP_HOME

