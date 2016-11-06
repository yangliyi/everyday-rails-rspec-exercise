# README
+ This is a project used to practice Rspec followed by the instructions in **Everyday Rails Rspec**
+ Below are some notes for each chapter.

## Chapter2: Setting up Rspec

### Step1: Add gems to Gemfile

```
group :development,:test do
  gem "rspec-rails", "~> 3.1.0"
  gem "factory_girl_rails", "~> 4.4.1"
end

group :test do
  gem "faker", "~> 1.4.3"
  gem "capybara", "~> 2.4.3"
  gem "database_cleaner", "~> 1.3.0"
  gem "launchy", "~> 2.4.2"
  gem "selenium-webdriver", "~> 2.43.0"
end
```
+ rspec-rails includes RSpec itself in a wrapper to add some extra Rails-specific features.+ factory_girl_rails replaces Rails’ default fixtures for feeding test data to the test suite with much more preferable factories.+ faker generates names, email addresses, and other placeholders for factories.+ capybara makes it easy to programatically simulate your users’ interactionswith your web application.+ database_cleaner helps make sure each spec run in RSpec begins with a cleanslate, by–you guessed it–cleaning data from the test database.+ launchy does one thing, but does it well: It opens your default web browser on demand to show you what your application is rendering. Very useful fordebugging tests.+ selenium-webdriver will let us test JavaScript-based browser interactions withCapybara.

### Step2: Setup dadabase 
+ Supposedly Rails has already set up for us by default.
+ Make sure databases are created: ```$ bin/rake db:create:all```

### Step3: Rspec Configration 
+ ```$ bin/rails generate rspec:install```
+ (Optional) add "--format documentation" to **.rspec**

### Step4: Generators (Optional)
Telling Rails to generate spec files for us when we use built-in generators for adding models, controllers, and scaffolds to our application.

+ Check out what is Railties: http://api.rubyonrails.org/classes/Rails/Railtie.html
+ In **config/application.rb**, add the code below inside Application class:

```
config.generatorsdo|g|  g.test_framework :rspec,
    fixtures: true,    view_specs: false,    helper_specs: false,    routing_specs: false,    controller_specs: true,    request_specs: false  g.fixture_replacement :factory_girl, dir: "spec/factories"end
``` 

+ fixtures: true specifies to generate a fixture for each model (using a Factory Girl factory, instead of an actual fixture)+ view_specs: false says to skip generating view specs. I won’t cover them in this book; instead we’ll use feature specs to test interface elements.+ helper_specs: false skips generating specs for the helper files Rails generates with each controller. As your comfort level with RSpec improves, consider changing this option to true and testing these files.+ routing_specs: false omits a spec file for your config/routes.rb file. If your application is simple, as the one in this book will be, you’re probably safe skipping these specs. As your application grows, however, and takes on more complex routing, it’s a good idea to incorporate routing specs.+ request_specs: false skips RSpec’s defaults for adding integration-level specs in spec/requests. We’ll cover this in chapter 8, at which time we’ll just create our own files.+ And finally, g.fixture_replacement :factory_girl tells Rails to generate factories instead of fixtures, and to save them in the spec/factories directory.

### Step5: First run Rspec

```$ bin/rspec```

