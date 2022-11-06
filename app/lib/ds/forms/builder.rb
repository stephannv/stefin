module Ds
  module Forms
    class Builder < ActionView::Helpers::FormBuilder
      include Ds::Helpers

      INPUT_BASE_CLASSES = "input input-bordered border-[3px] w-full font-semibold".freeze
      INPUT_ERROR_CLASSES = "input-error"
      SELECT_BASE_CLASSES = "select select-bordered border-[3px] w-full font-semibold".freeze
      SELECT_ERROR_CLASSES = "select-error"

      attr_reader :template

      delegate :render, to: :template

      def ds_label(attribute)
        label attribute, class: "label font-black" do |builder|
          template.content_tag :span, builder.translation, class: "label-text text-lg"
        end
      end

      def ds_text_field(attribute, **options)
        input_with_error_message attribute do
          text_field(attribute, options.reverse_merge(class: input_classes(attribute)))
        end
      end

      def ds_date_field(attribute, **options)
        input_with_error_message attribute do
          date_field(attribute, options.reverse_merge(type: "date", class: input_classes(attribute)))
        end
      end

      def ds_money_field(attribute, **options)
        input_with_error_message attribute do
          text_field attribute,
            options.reverse_merge(
              inputmode: "numeric", class: input_classes(attribute), data: {controller: "money-field"}
            )
        end
      end

      def ds_collection_select(attribute, collection, value_method, text_method, options = {}, html_options = {})
        input_with_error_message attribute do
          collection_select attribute,
            collection,
            value_method,
            text_method,
            options,
            **html_options.merge(class: select_classes(attribute))
        end
      end

      def ds_radio_button(attribute, value, **options, &content)
        radio_button id: field_id(attribute), name: field_name(attribute), value: value, checked: object.send(attribute).to_s == value.to_s, &content
      end

      def ds_color_field(attribute, **options)
        input_with_error_message(attribute) do
          color_picker(id: field_id(attribute), name: field_name(attribute), selected: object.send(attribute))
        end
      end

      def ds_errors(attribute)
        input_error_message { errors_for(attribute) } if object.errors.key?(attribute)
      end

      def ds_submit(value = nil, **options)
        submit(value, options.reverse_merge(class: "btn btn-primary font-black text-lg"))
      end

      private

      def input_with_error_message(attribute, &block)
        template.capture do
          template.concat block.call
          template.concat ds_errors(attribute)
        end
      end

      def errors_for(attribute)
        object.errors[attribute].to_sentence if object.errors.key?(attribute)
      end

      def input_classes(attribute)
        [INPUT_BASE_CLASSES, INPUT_ERROR_CLASSES => object.errors.key?(attribute)]
      end

      def select_classes(attribute)
        [SELECT_BASE_CLASSES, SELECT_ERROR_CLASSES => object.errors.key?(attribute)]
      end
    end
  end
end
