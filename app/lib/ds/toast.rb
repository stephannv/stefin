module Ds
  class Toast < Ds::Base
    BORDER_CLASSES = {
      info: "border-info",
      success: "border-success",
      warning: "border-warning",
      error: "border-error"
    }

    ICON_NAMES = {
      info: :information,
      success: :check_circle,
      warning: :exclamation_circle,
      error: :x_circle
    }.freeze

    ICON_COLORS = {
      info: "fill-info",
      success: "fill-success",
      warning: "fill-warning",
      error: "fill-error"
    }.freeze

    def initialize(type: :info, **html_options)
      @type = type.to_sym
      @html_options = html_options
    end

    private

    attr_reader :type, :html_options

    def template(&content)
      div class: "toast max-lg:w-full animate-fade-in-up", **html_options do
        div class: tokens("alert justify-start bg-white shadow border", border_class) do
          icon name: icon_name, size: "w-8 h-8", color: icon_color
          div(&content)
        end
      end
    end

    def border_class
      BORDER_CLASSES[type]
    end

    def icon_name
      ICON_NAMES[type]
    end

    def icon_color
      ICON_COLORS[type]
    end
  end
end
