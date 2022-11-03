module Ds
  module Feedback
    class Toast < Ds::Base
      COLOR_CLASSES = {
        info: "alert-info",
        success: "alert-success",
        warning: "alert-warning",
        error: "alert-error"
      }.freeze

      ICON_NAMES = {
        info: :information_circle,
        success: :check_circle,
        warning: :exclamation_triangle,
        error: :x_circle
      }.freeze

      def initialize(type: :info, **html_options)
        @type = type.to_sym
        @html_options = html_options
      end

      private

      attr_reader :type, :html_options

      def template(&content)
        div class: "toast max-lg:w-full animate-fade-in-up", **html_options do
          div(**classes("alert lg:text-xl justify-start", color_classes)) do
            icon name: icon_name, outline: true, size: "w-8 h-8"
            div(&content)
          end
        end
      end

      def color_classes
        COLOR_CLASSES[type]
      end

      def icon_name
        ICON_NAMES[type]
      end
    end
  end
end
