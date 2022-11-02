module App
  class Toast < ApplicationView
    def initialize(flash:)
      @type, @message = flash.first
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
  end
end
