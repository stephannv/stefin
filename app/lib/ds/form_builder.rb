module Ds
  class FormBuilder < ActionView::Helpers::FormBuilder
    include Ds::Helpers

    INPUT_BASE_CLASSES = "input input-bordered w-full hover:border-primary focus:border-primary transition-all".freeze
    INPUT_ERROR_CLASSES = "input-error"
    SELECT_BASE_CLASSES = "select select-bordered w-full font-normal".freeze
    SELECT_ERROR_CLASSES = "select-error"

    attr_reader :template

    delegate :render, to: :template

    def label(attribute)
      super(attribute, class: "label")
    end

    def text_field(attribute, **options)
      input_with_error_message attribute do
        super(attribute, options.reverse_merge(class: input_classes(attribute)))
      end
    end

    def email_field(attribute, **options)
      input_with_error_message attribute do
        super(attribute, options.reverse_merge(type: "email", class: input_classes(attribute)))
      end
    end

    def password_field(attribute, **options)
      input_with_error_message attribute do
        super(attribute, options.reverse_merge(type: "password", class: input_classes(attribute)))
      end
    end

    def money_field(attribute, **options)
      text_field(attribute, **options.merge(inputmode: "numeric", data: {controller: "money-field"}))
    end

    def date_field(attribute, **options)
      input_with_error_message attribute do
        super(attribute, options.reverse_merge(type: "date", class: input_classes(attribute)))
      end
    end

    def collection_select(attribute, collection, value_method, text_method, options = {}, html_options = {})
      input_with_error_message attribute do
        super(attribute,
          collection,
          value_method,
          text_method,
          options,
          **html_options.merge(class: select_classes(attribute))
        )
      end
    end

    def radio_button(attribute, value, **options, &content)
      radio id: field_id(attribute), name: field_name(attribute), value: value, checked: object.send(attribute).to_s == value.to_s, &content
    end

    def color_field(attribute, **options)
      input_with_error_message(attribute) do
        color_picker(id: field_id(attribute), name: field_name(attribute), selected: object.send(attribute))
      end
    end

    def errors(attribute)
      input_error { errors_for(attribute) } if has_error?(attribute)
    end

    def submit(value = nil, icon: :save, **options)
      value ||= submit_default_value
      template.button_tag(value, options.reverse_merge(class: "btn btn-primary font-normal flex gap-2")) do
        template.capture do
          template.concat icon(name: icon, size: "w-5 h-5") if icon.present?
          template.concat submit_default_value
        end
      end
    end

    private

    def input_with_error_message(attribute, &block)
      template.capture do
        template.concat block.call
        template.concat errors(attribute)
      end
    end

    def errors_for(attribute)
      return if object.blank?

      object.errors[attribute].to_sentence if has_error?(attribute)
    end

    def has_error?(attribute)
      object&.errors&.key?(attribute)
    end

    def input_classes(attribute)
      [INPUT_BASE_CLASSES, INPUT_ERROR_CLASSES => has_error?(attribute)]
    end

    def select_classes(attribute)
      [SELECT_BASE_CLASSES, SELECT_ERROR_CLASSES => has_error?(attribute)]
    end
  end
end
