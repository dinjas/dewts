# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action { flash.clear }
end
