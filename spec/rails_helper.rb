# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
# Add additional requires below this line. Rails is not loaded until this point!

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!

  # This allows you to use the core set of syntax methods
  # (build, build_stubbed, create, attributes_for, and their *_list counterparts)
  # without having to call them on FactoryBot directly
  config.include FactoryBot::Syntax::Methods
end

def klass_name
  described_class.name.underscore
end

def subject_class
  klass_name.to_sym
end

def subject_class_factory
  klass_name.split('/').last.to_sym
end

def factory
  build(subject_class_factory)
end

def factory_stubbed
  build_stubbed(subject_class_factory)
end

def factory_create
  create(subject_class_factory)
end

# def rendered_strings(pdf_object)
#   PDF::Inspector::Text.analyze(pdf_object.render).strings
# end
