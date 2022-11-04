module Ds
  module Actions
    class LinkButton < Ds::Base
      COLOR_CLASSES = {
        primary: "btn-primary",
        secondary: "btn-secondary",
        accent: "btn-accent",
        ghost: "btn bg-transparent text-base-content border-[3px] border-base-content hover:border-base-content hover:bg-transparent",
        link: "btn-link",
        info: "btn-info",
        success: "btn-success",
        warning: "btn-warning",
        error: "btn-error"
      }.freeze

      SIZE_CLASSES = {
        xs: "btn-xs",
        sm: "btn-sm",
        lg: "btn-lg"
      }.freeze

      def initialize(color: nil, size: nil, square: false, outline: false, **html_options)
        @color = color
        @size = size
        @square = square
        @outline = outline
        @extra_classes = html_options.delete(:class)
        @html_options = html_options
      end

      private

      attr_reader :color, :size, :square, :outline, :extra_classes, :html_options

      def template(&content)
        a class: build_classes, **html_options do
          yield_content(&content)
        end
      end

      def build_classes
        tokens(
          "btn font-black text-lg flex gap-2",
          color_classes,
          size_classes,
          extra_classes,
          square?: "btn-square",
          outline?: "btn-outline"
        )
      end

      def color_classes = COLOR_CLASSES[color]

      def size_classes = SIZE_CLASSES[size]

      def square? = @square

      def outline? = @outline
    end
  end
end
