# frozen_string_literal: true

module ApplicationHelper
  include FlashHelper

  DEWTS = 'Dewts'
  private_constant :DEWTS

  def app_name
    DEWTS
  end

end
