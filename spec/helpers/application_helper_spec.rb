# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do

  describe '#app_name' do
    it 'works' do
      result = helper.app_name

      expect(result).to eql('Dewts')
    end
  end
end
