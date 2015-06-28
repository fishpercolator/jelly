source 'https://rubygems.org'

# Ruby version (needed by Heroku)
ruby '2.2.2'

gem 'dotenv-rails', groups: [:development, :test]
gem 'rails', '4.2.3'
gem 'pg', '~> 0.18.2'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Include Bootstrap styles & JS
gem 'bootstrap-sass', '~> 3.3.5'
gem 'bootswatch-rails', '~> 3.3.4'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '~> 2.7.1'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# Use Haml for views
gem 'haml-rails', '~> 0.9.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyracer', '~> 0.12.2', platforms: :ruby
# Use jquery as the JavaScript library
gem 'jquery-rails', '~> 3.1.3'
gem 'turbolinks', '~> 2.5.3'

# Use Puma as the application server
gem 'puma', '~> 2.11.3'

# Stuff for my app
gem 'devise', '~> 3.5.1'
gem 'devise-bootstrap-views', '~> 0.0.5'
gem 'cancancan', '~> 1.11.0'
gem 'rolify', '~> 4.0.0'
gem 'formtastic-bootstrap', github: 'mjbellantoni/formtastic-bootstrap'
gem 'mail', '~> 2.6.3'
gem 'gravatar_image_tag', '~> 1.2.0'
#gem 'jquery-ui-sass-rails', '~> 4.0.3.0'
gem 'bootstrap-datepicker-rails', '~> 1.4.0'
# The upstream repo for this contains my patch to update it to Reveal 3.1.0
gem 'rails-reveal-js', github: 'negativetwelve/rails-reveal-js'
gem 'animate.css-rails', '~> 3.2.0'
gem 'redcarpet', '~> 3.3.1'
gem 'simple_calendar', '~> 1.1.0'
gem 'weekend_warrior', '~> 1.0.0'

# Gem used by Heroku to avoid plugin injection
group :production do
  gem 'rails_12factor'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.1.3'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :test do
  # Lots of stuff used for nice tests
  gem 'rspec-rails', '~> 3.0'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'capybara-screenshot'
  gem 'poltergeist'
end
