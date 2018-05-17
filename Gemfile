source 'https://rubygems.org'
git_source(:github) { |repo| 'https://github.com/#{repo}.git' }

ruby '2.5.0'

# Rails support
gem 'rails', '~> 5.2.0'
gem 'pg'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'yarn'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'haml-rails', '~> 1.0'


# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  # Call 'byebug' anywhere stop execution and get a debugger console
  gem 'byebug'
  gem 'pry-rails'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console'
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'annotate'
  gem 'hint-rubocop_style'
end

group :test do
  gem 'capybara'
  gem 'factory_bot_rails'
  gem 'rspec-rails'

  # mutation testing
  gem 'mutant'
  gem 'mutant-rspec'
  gem 'mutator_rails'
  gem 'parser', '= 2.4.0.2'


  gem 'rspec_junit_formatter'
  gem 'codeclimate-test-reporter'
end
