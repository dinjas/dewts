# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DewtsDeviseHelper, type: :helper do
  before do
    @request.env['devise.mapping'] = Devise.mappings[:user]
  end

  # TODO: auto-generated
  describe '#show_signin_link?' do
    it 'works' do
      result = helper.show_signin_link?

      expect(result).not_to be_nil
    end
  end

  # TODO: auto-generated
  describe '#show_signup_link?' do
    it 'works' do
      result = helper.show_signup_link?

      expect(result).not_to be_nil
    end
  end

  # TODO: auto-generated
  describe '#show_confirmation_instructions_link?' do
    it 'works' do
      result = helper.show_confirmation_instructions_link?

      expect(result).not_to be_nil
    end
  end

  # TODO: auto-generated
  describe '#show_forgot_password_link?' do
    it 'works' do
      result = helper.show_forgot_password_link?

      expect(result).not_to be_nil
    end
  end

  # TODO: auto-generated
  describe '#show_unlock_link?' do
    it 'works' do
      result = helper.show_unlock_link?

      expect(result).not_to be_nil
    end
  end

  # TODO: auto-generated
  describe '#controller?' do
    it 'works' do
      str = 'user'

      result = helper.controller?(str)

      expect(result).not_to be_nil
    end
  end

  # TODO: auto-generated
  describe '#resend_confirmation_email_for' do
    it 'works' do
      resource = create(:user)

      result = helper.resend_confirmation_email_for(resource)

      expect(result).not_to be_nil
    end
  end

end
