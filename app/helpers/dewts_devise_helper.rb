# frozen_string_literal: true

module DewtsDeviseHelper
  include Devise::Controllers::Helpers

  # Attempt to find the mapped route for devise based on request path
  def devise_mapping
    @devise_mapping ||= request.env['devise.mapping']
  end

  def show_signin_link?
    return false if user_signed_in?

    !controller?('sessions')
  end

  def show_signup_link?
    return false if user_signed_in?

    devise_mapping.registerable? &&
      !controller?('registrations')
  end

  def show_confirmation_instructions_link?
    return false if user_signed_in?
    devise_mapping.confirmable? && !controller?('confirmations')
  end

  def show_forgot_password_link?
    devise_mapping.confirmable? &&
      !controller?('passwords') &&
      !controller?('registrations')
  end

  def show_unlock_link?
    return false if user_signed_in?

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

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def resource_class
    User
  end

end
