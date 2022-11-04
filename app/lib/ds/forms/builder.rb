module Ds
  module Forms
    class Builder < ActionView::Helpers::FormBuilder
      include Ds::Helpers

      INPUT_BASE_CLASSES = "input input-bordered border-[3px] w-full font-semibold".freeze
      INPUT_ERROR_CLASSES = "input-error"

      attr_reader :template

      delegate :render, to: :template

      def label(attribute)
        super(attribute, class: "label font-black") do |builder|
          template.content_tag :span, builder.translation, class: "label-text text-lg"
        end
      end

      def text_field(attribute, **options)
        template.capture do
          template.concat super(attribute, options.reverse_merge(class: input_classes(attribute)))

          template.concat input_error_message { error_messages(attribute) } if object.errors.key?(attribute)
        end
      end

      def error_messages(attribute)
        object.errors[attribute].to_sentence if object.errors.key?(attribute)
      end

      def submit(value = nil, **options)
        super(value, options.reverse_merge(class: "btn btn-primary font-black text-lg"))
      end

      private

      def input_classes(attribute)
        [INPUT_BASE_CLASSES, INPUT_ERROR_CLASSES => object.errors.key?(attribute)]
      end
    end
  end
end
