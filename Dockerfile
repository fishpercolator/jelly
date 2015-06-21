FROM ruby:2.2.2
MAINTAINER Rich Daley <rich@fishpercolator.co.uk>
ENV REFRESHED_AT 2015-06-17

RUN apt-get update -qq
RUN apt-get dist-upgrade -yqq

ADD http://ftp.uk.debian.org/debian/pool/main/p/phantomjs/phantomjs_1.9.0-1+b1_amd64.deb /tmp/
RUN dpkg -i /tmp/phantomjs_1.9.0-1+b1_amd64.deb
RUN gem install bundler

ENV APP_HOME        /usr/src/jelly
ENV RAILS_ENV       production
ENV APPHOST         localhost:3000
# NOTE: ALWAYS override this or your sessions will be insecure!
ENV SECRET_KEY_BASE fcea7d7ea0a7ee4583952b1970770202419227f2ebcfe6924133b0e8eff99e78879b8cdf7c9e4f844207f390d982af1c0399131a94c82beff21ae25401fff322

RUN mkdir $APP_HOME
WORKDIR $APP_HOME
ADD Gemfile* $APP_HOME/

ENV BUNDLE_GEMFILE=$APP_HOME/Gemfile BUNDLE_JOBS=2 BUNDLE_PATH=/bundle

RUN bundle install

ADD . $APP_HOME

RUN RAILS_ENV=production bundle exec rake assets:precompile

# Keep env empty
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
