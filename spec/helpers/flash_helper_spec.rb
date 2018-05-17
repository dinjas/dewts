# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FlashHelper, type: :helper do
  let(:flash_type) { 'notice' }
  let(:message) { 'some awesome string!' }
  let(:flash) { { notice: message } }

  describe '#flash_messages' do
    it 'returns expected' do
      allow(helper).to receive(:flash).and_return(flash)
      result = helper.flash_messages

      expect(result).to eql('<div class="alert alert-info alert-dismissible fade show" role="alert">'\
                              '<button class="close" data-dismiss="alert" aria-label="Close">'\
                              '<span aria-hidden="true">&times;</span></button>'\
                              '<i class="fa fa-info-circle"></i> some awesome string!</div>')
    end

    it 'returns expected with alternate' do
      allow(helper).to receive(:flash).and_return(danger: 'light')
      result = helper.flash_messages

      expect(result).to eql('<div class="alert alert-danger alert-dismissible fade show" role="alert">'\
                              '<button class="close" data-dismiss="alert" aria-label="Close">'\
                              '<span aria-hidden="true">&times;</span></button>'\
                              '<i class="fa fa-times-circle"></i> light</div>')
    end
  end

  describe '#alert_classes' do
    let(:expected_for_info) { 'alert alert-info alert-dismissible fade show' }
    let(:expected_for_dark) { 'alert alert-dark alert-dismissible fade show' }

    it 'works with a symbol' do
      flash_type = :info
      result = helper.alert_classes(flash_type)

      expect(result).to eql(expected_for_info)
    end

    it 'works with an alternate symbol' do
      flash_type = :dark
      result = helper.alert_classes(flash_type)

      expect(result).to eql(expected_for_dark)
    end

    it 'works with a string' do
      flash_type = 'info'
      result = helper.alert_classes(flash_type)

      expect(result).to eql(expected_for_info)
    end
  end

  describe '#flash_body' do
    it 'works' do
      before = helper.output_buffer.dup
      result = helper.flash_body(message)
      after  = helper.output_buffer
      diff   = result.slice(before.size..after.size)

      expect(result).to eql(' some awesome string!')
      expect(diff).to eql(result)
    end
  end

  describe '#translated_flash_type' do
    it 'works' do
      result = helper.translated_flash_type(flash_type)

      expect(result).to eql('info')
    end

    it 'works with a valid hash type' do
      flash_type = 'error'
      result = helper.translated_flash_type(flash_type)

      expect(result).to eql('error')
    end
  end

  describe '#flash_close_button' do
    it 'works' do
      before = helper.output_buffer.dup
      result = helper.flash_close_button
      after  = helper.output_buffer
      diff   = result.slice(before.size..after.size)

      expect(result).to eql('<button class="close" data-dismiss="alert" aria-label="Close">'\
                              '<span aria-hidden="true">&times;</span></button>')
      expect(diff).to eql(result)
    end

    it 'concats' do
    end
  end

  describe '#flash_close_button_content' do
    it 'works' do
      before = helper.output_buffer.dup
      result = helper.flash_close_button_content
      after  = helper.output_buffer
      diff   = result.slice(before.size..after.size)

      expect(result).to eql('<span aria-hidden="true">&times;</span>')
      expect(diff).to eql(result)
    end
  end

  describe '#flash_close_button_wrapper' do
    it 'works' do
      result = helper.flash_close_button_wrapper { 'hi' }

      expect(result).to eql('<button class="close" data-dismiss="alert" aria-label="Close">hi</button>')
    end
  end

  describe '#flash_content' do
    it 'works' do
      result = helper.flash_content(flash_type, message)

      expect(result).to eql('<button class="close" data-dismiss="alert" aria-label="Close">'\
                              '<span aria-hidden="true">&times;</span></button>'\
                              '<i class="fa fa-info-circle"></i> some awesome string!')
    end

    it 'works with danger' do
      result = helper.flash_content(:danger, :foo)

      expect(result).to eql('<button class="close" data-dismiss="alert" aria-label="Close">'\
                              '<span aria-hidden="true">&times;</span></button>'\
                              '<i class="fa fa-times-circle"></i> foo')
    end
  end

  describe '#flash_favicon_classes' do
    it 'works for notice' do
      result = helper.flash_favicon_classes(flash_type)

      expect(result).to eql('info-circle')
    end

    it 'works for info' do
      result = helper.flash_favicon_classes(:info)

      expect(result).to eql('info-circle')
    end

    it 'works for alert' do
      result = helper.flash_favicon_classes(:alert)

      expect(result).to eql('times-circle')
    end

    it 'works for danger' do
      result = helper.flash_favicon_classes(:danger)

      expect(result).to eql('times-circle')
    end

    it 'works for error' do
      result = helper.flash_favicon_classes(:error)

      expect(result).to eql('times-circle')
    end

    it 'works for success' do
      result = helper.flash_favicon_classes(:success)

      expect(result).to eql('check-circle')
    end

    it 'works for random' do
      result = helper.flash_favicon_classes(:random_thing)

      expect(result).to eql('info-circle')
    end
  end

  describe '#flash_favicon' do
    it 'works' do
      result = helper.flash_favicon(flash_type)

      expect(result).to eql('<i class="fa fa-info-circle"></i>')
    end

    it 'concats' do
      before   = helper.output_buffer.dup
      result   = helper.flash_favicon(:danger)
      after    = helper.output_buffer
      diff     = after.slice(before.size..after.size)

      expect(result).to eql('<i class="fa fa-times-circle"></i>')
      expect(diff).to eql(result)
    end

    it 'works with alternate flash types' do
      result = helper.flash_favicon(:danger)

      expect(result).to eql('<i class="fa fa-times-circle"></i>')
    end
  end

  describe '#flash_wrapper' do
    it 'works' do
      result = helper.flash_wrapper(:info) { 'foo, bar' }

      expect(result).to eql('<div class="alert alert-info alert-dismissible fade show" role="alert">foo, bar</div>')
    end
  end
end
