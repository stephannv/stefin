module Ds
  module Structures
    class Card < Ds::Base
      def initialize(compact: false, **html_options)
        @compact = compact
        @extra_classes = html_options.delete(:class)
        @html_options = html_options
      end

      def body(&content)
        div class: "card-body p-4 lg:p-8", &content
      end

      def title(&content)
        div class: "card-title font-black", &content
      end

      private

      attr_reader :extra_classes, :html_options

      def template(&content)
        div class: build_classes, **html_options, &content
      end

      def build_classes
        tokens("card bg-base-100 border-[4px] border-primary", extra_classes, compact?: "card-compact")
      end

      def compact? = @compact
    end
  end
end
