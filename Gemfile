source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri

  gem "rspec-rails", "~> 3.1.0"
  # rspec-rails includes RSpec itself in a wrapper to add some extra Rails-specific features.
  gem "factory_girl_rails", "~> 4.4.1"
  # factory_girl_rails replaces Rails’ default fixtures for feeding test data to the test suite with much more preferable factories.
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem "faker", "~> 1.4.3"
  # faker generates names, email addresses, and other placeholders for factories.
  gem "capybara", "~> 2.4.3"
  # capybara makes it easy to programatically simulate your users’ interactions
  # with your web application.
  gem "database_cleaner", "~> 1.3.0"
  # database_cleaner helps make sure each spec run in RSpec begins with a clean
  # slate, by–you guessed it–cleaning data from the test database.
  gem "launchy", "~> 2.4.2"
  # launchy does one thing, but does it well: It opens your default web browser on demand to show you what your application is rendering. Very useful for
  # debugging tests.
  gem "selenium-webdriver", "~> 2.43.0"
  # selenium-webdriver will let us test JavaScript-based browser interactions with
  # Capybara.

  # Code Climate
  gem "simplecov"
  gem "codeclimate-test-reporter", "~> 1.0.0"

end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
