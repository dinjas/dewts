# frozen_string_literal: true

module DewtsDeviseHelper
  include Devise::Controllers::Helpers

  def show_signin_link?
    !controller?('sessions')
  end

  def show_signup_link?
    devise_mapping.registerable? && !controller?('registrations')
  end

  def show_confirmation_instructions_link?
    devise_mapping.confirmable? && !controller?('confirmations')
  end

  def show_forgot_password_link?
    devise_mapping.confirmable? &&
      !controller?('passwords') &&
      !controller?('registrations')
  end

  def show_unlock_link?
    devise_mapping.lockable? &&
      resource_class.unlock_strategy_enabled?(:email) &&
      !controller?('unlocks')
  end

  def controller?(str)
    controller_name.eql?(str)
  end

  def resend_confirmation_email_for(resource)
    if resource.pending_reconfirmation?
      resource.unconfirmed_email
    else
      resource.email
    end
  end
end
