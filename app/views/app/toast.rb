module App
  class Toast < ApplicationView
    def initialize(flash:)
      @type, @message = flash.first
      @type = sanitize_toast_type(@type)
    end

    private

    attr_reader :type, :message

    def template(&content)
      toast(type: type) do
        message
      end
    end

    def render?
      message.present?
    end

    def sanitize_toast_type(type)
      case type
      when "notice"
        :success
      when "alert"
        :error
      else
        type
      end
    end
  end
end
