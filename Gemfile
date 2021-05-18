# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| 'https://github.com/#{repo}.git' }

ruby '2.6.6'

# Rails support
gem 'rails', '~> 5.2.3'
gem 'pg'
gem 'jbuilder', '~> 2.5'

# App Server
gem 'puma', '~> 4.3'

# Make development fun
gem 'awesome_print'
gem 'ice_nine'

# Security
gem 'devise'

# Front-End
gem 'bootstrap'
gem 'font-awesome-rails'
gem 'haml-rails', '~> 1.0'
gem 'jquery-rails'
gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'
gem 'yarn'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  # Call 'byebug' anywhere stop execution and get a debugger console
  gem 'byebug'
  gem 'capybara'
  gem 'factory_bot_rails'
  gem 'pry-rails'
  gem 'rspec-jumpstart'
  gem 'rspec-rails'
  gem 'simplecov', require: false
end

group :development do
  # Access an interactive console on exception pages or by calling 'console'
  gem 'hint-rubocop_style'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'haml_lint', require: false
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'annotate'

  gem 'mutant'
  gem 'mutant-rspec'
  gem 'mutator_rails'
  gem 'parser', '= 2.4.0.2'

  gem 'rspec_junit_formatter'
end
