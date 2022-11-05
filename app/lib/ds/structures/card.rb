module Ds
  module Structures
    class Card < Ds::Base
      def initialize(compact: false, **html_options)
        @compact = compact
        @extra_classes = html_options.delete(:class)
        @html_options = html_options
      end

      def body(&content)
        div class: "p-4 lg:p-8", &content
      end

      def title(&content)
        h1 class: "text-xl font-black", &content
      end

      private

      attr_reader :extra_classes, :html_options

      def template(&content)
        div class: build_classes, **html_options, &content
      end

      def build_classes
        tokens("bg-base-100 rounded-lg border-[4px] border-primary", extra_classes)
      end

      def compact? = @compact
    end
  end
end
