source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", "1.13.0", require: false

# Bundle and process CSS [https://github.com/rails/cssbundling-rails]
gem "cssbundling-rails", "1.1.1"

# EnumerateIt helps you to declare and use enumerations in a very simple and flexible way. [https://github.com/lucascaton/enumerate_it]
gem "enumerate_it", "3.2.4"

# Bundle and transpile JavaScript [https://github.com/rails/jsbundling-rails]
gem "jsbundling-rails", "1.0.3"

# A Ruby Library for dealing with money and currency conversion. [https://github.com/RubyMoney/money]
gem "money", "6.16.0"

# Use postgresql as the database for Active Record
gem "pg", "1.4.4"

# Phlex is a framework for building fast, reusable, testable views in pure Ruby. [https://github.com/joeldrapper/phlex]
gem "phlex", github: "joeldrapper/phlex"

# The modern asset pipeline for Rails [https://github.com/rails/propshaft]
gem "propshaft", "0.6.4"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "5.6.5"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "7.0.4"

# Composable Ruby service objects [https://github.com/sunny/actor]
gem "service_actor", "3.4.1"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails", "1.1.0"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails", "1.3.2"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", "2.0.5", platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", "1.6.3", platforms: %i[mri mingw x64_mingw]

  # factory_bot is a fixtures replacement with a straightforward definition syntax [https://github.com/thoughtbot/factory_bot_rails]
  gem "factory_bot_rails", "6.2.0"
end

group :development do
  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  gem "rack-mini-profiler", "3.0.0"

  # Ruby Style Guide, with linter & automatic code fixer [https://github.com/testdouble/standard]
  gem "standard", "1.16.1"

  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console", "4.2.0"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara", "3.37.1"

  # Behaviour Driven Development for Ruby. [https://relishapp.com/rspec/rspec-rails/docs]
  gem "rspec-rails", "6.0.1"

  # This gem provides Ruby bindings for Selenium and supports MRI >= 2.6 [https://github.com/SeleniumHQ/selenium/tree/trunk/rb]
  gem "selenium-webdriver", "4.5.0"

  # Provides RSpec compatible one-liners to test common Rails functionality [https://github.com/thoughtbot/shoulda-matchers]
  gem "shoulda-matchers", "5.2.0"

  # SimpleCov is a code coverage analysis tool for Ruby. [https://github.com/simplecov-ruby/simplecov]
  gem "simplecov", "0.21.2"

  # Run Selenium tests more easily with install and updates for all supported webdrivers [https://github.com/titusfortner/webdrivers]
  gem "webdrivers", "5.2.0"
end
