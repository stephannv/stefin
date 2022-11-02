module Ds
  module Forms
    class Builder < ActionView::Helpers::FormBuilder
      include Ds::Helpers

      attr_reader :template

      delegate :render, to: :template

      def label(attribute)
        super(attribute, class: "label font-semibold") do |builder|
          template.content_tag :span, builder.translation, class: "label-text"
        end
      end

      def text_field(attribute, **options)
        template.capture do
          template.concat super(attribute, options.reverse_merge(class: "input input-bordered w-full"))
          template.concat input_error_message { error_messages(attribute) }
        end
      end

      def error_messages(attribute)
        object.errors[attribute].to_sentence.capitalize.concat(".") if object.errors.key?(attribute)
      end

      def submit(value = nil, **options)
        super(value, options.reverse_merge(class: "btn btn-primary"))
      end
    end
  end
end
