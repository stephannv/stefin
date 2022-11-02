module Ds
  module Actions
    class LinkButton < Ds::Base
      COLOR_CLASSES = {
        primary: "btn-primary",
        secondary: "btn-secondary",
        accent: "btn-accent",
        ghost: "btn-ghost",
        link: "btn-link",
        info: "btn-info",
        success: "btn-success",
        warning: "btn-warning",
        error: "btn-error"
      }.freeze

      def initialize(color: nil, **html_options)
        @color = color
        @extra_classes = html_options.delete(:class)
        @html_options = html_options
      end

      private

      attr_reader :color, :extra_classes, :html_options

      def template(&content)
        a(**html_options.reverse_merge(classes("btn", color_classes, extra_classes))) do
          yield_content(&content)
        end
      end

      def color_classes
        COLOR_CLASSES[color]
      end
    end
  end
end
