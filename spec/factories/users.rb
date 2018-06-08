# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { "somebody-#{Time.current.to_f}@example.com" }
    password 'password'
  end
end
