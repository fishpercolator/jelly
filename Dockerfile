FROM ruby:2.3
MAINTAINER Rich Daley <rich@fishpercolator.co.uk>
ENV REFRESHED_AT 2016-05-09

# This line is needed for JavaScript testing with headless+capybara-webkit
RUN apt-get update -y && apt-get install less xvfb qt5-default libqt5webkit5-dev -y && apt-get clean

RUN gem install bundler

ENV APP_HOME        /usr/src/jelly
ENV RAILS_ENV       production

RUN mkdir $APP_HOME
WORKDIR $APP_HOME
ADD Gemfile* $APP_HOME/

ENV BUNDLE_GEMFILE=$APP_HOME/Gemfile BUNDLE_JOBS=2 BUNDLE_PATH=/bundle

RUN bundle install

ENV APPHOST         localhost:3000
# NOTE: ALWAYS override this or your sessions will be insecure!
ENV SECRET_KEY_BASE fcea7d7ea0a7ee4583952b1970770202419227f2ebcfe6924133b0e8eff99e78879b8cdf7c9e4f844207f390d982af1c0399131a94c82beff21ae25401fff322

ADD . $APP_HOME

RUN RAILS_ENV=production bundle exec rake assets:precompile

CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
