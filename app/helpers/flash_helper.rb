# frozen_string_literal: true

# Helper class to handle displaying flash content in a bootstrap-friendly manner
module FlashHelper

  FAVICON_CHECK = 'check-circle'
  FAVICON_TIMES = 'times-circle'
  FAVICON_INFO  = 'info-circle'

  FAVICON_CLASSES = IceNine.deep_freeze({
                                            alert:     FAVICON_TIMES,
                                            danger:    FAVICON_TIMES,
                                            dark:      FAVICON_INFO,
                                            error:     FAVICON_TIMES,
                                            info:      FAVICON_INFO,
                                            light:     FAVICON_INFO,
                                            notice:    FAVICON_INFO,
                                            primary:   FAVICON_INFO,
                                            secondary: FAVICON_INFO,
                                            success:   FAVICON_CHECK
                                        }.with_indifferent_access)

  FLASH_TYPES_WITH_STYLES = %i(alert
                               danger
                               dark
                               error
                               info
                               light
                               primary
                               secondary
                               success).freeze
  private_constant(*constants(false))

  def flash_messages
    capture do
      flash.each do |flash_type, message|
        tft = translated_flash_type(flash_type)
        concat(flash_wrapper(tft) { flash_content(tft, message) })
      end
    end
  end

  # Below methods are not intended to be called directly.
  # They were made public so they can be directly targeted by tests.

  def alert_classes(flash_type)
    "alert alert-#{flash_type} alert-dismissible fade show"
  end

  def flash_body(message)
    concat(" #{message}")
  end

  def translated_flash_type(flash_type)
    return flash_type if FLASH_TYPES_WITH_STYLES.include?(flash_type.to_sym)

    'info'
  end

  def flash_close_button
    concat(flash_close_button_wrapper { flash_close_button_content })
  end

  def flash_close_button_content
    concat(content_tag(:span,
                       ActiveSupport::SafeBuffer.new('&times;'),
                       'aria-hidden' => true))
  end

  def flash_close_button_wrapper
    content_tag(:button, class: 'close', data: { dismiss: 'alert' }, 'aria-label' => 'Close') do
      yield
    end
  end

  def flash_content(flash_type, message)
    flash_close_button
    flash_favicon(flash_type)
    flash_body(message)
  end

  def flash_favicon_classes(flash_type)
    FAVICON_CLASSES.fetch(flash_type, FAVICON_INFO)
  end

  def flash_favicon(flash_type)
    concat(fa_icon(flash_favicon_classes(flash_type)))
  end

  def flash_wrapper(flash_type)
    content_tag(:div, class: alert_classes(flash_type), role: 'alert') do
      yield
    end
  end
end
