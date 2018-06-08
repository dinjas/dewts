# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe '#index' do
    it 'GET index' do
      get :index

      expect(response).to have_http_status(:ok)
    end
  end

  describe '#about' do
    it 'GET about' do
      get :about

      expect(response).to have_http_status(:ok)
    end
  end

end
