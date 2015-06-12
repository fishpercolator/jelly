source 'https://rubygems.org'

# Ruby version (needed by Heroku)
ruby '2.2.1'

gem 'rails', '4.2.1'
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Include Bootstrap styles & JS
gem 'bootstrap-sass', '~> 3.3.4'
gem 'bootswatch-rails', '~> 3.2.4'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# Use Haml for views
gem 'haml-rails', '~> 0.9'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby
# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'turbolinks'

# Use Puma as the application server
gem 'puma', '~> 2.11'

# Stuff for my app
gem 'devise', '~> 3.4.1'
gem 'devise-bootstrap-views', '~> 0.0.5'
gem 'cancancan', '~> 1.10.1'
gem 'rolify', '~> 4.0.0'
gem 'formtastic-bootstrap', github: 'mjbellantoni/formtastic-bootstrap'
gem 'mail', '~> 2.6.3'
gem 'gravatar_image_tag', '~> 1.2.0'
#gem 'jquery-ui-sass-rails', '~> 4.0.3.0'
gem 'bootstrap-datepicker-rails', '~> 1.4.0'
gem 'rails-reveal-js', github: 'fishpercolator/rails-reveal-js'
gem 'animate.css-rails', '~> 3.2.0'
gem 'redcarpet', '~> 3.3.1'
gem 'simple_calendar', '~> 1.1.0'

# Gem used by Heroku to avoid plugin injection
group :production do
  gem 'rails_12factor'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

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
