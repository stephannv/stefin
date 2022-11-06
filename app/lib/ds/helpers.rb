module Ds
  module Helpers
    COMPONENTS = {
      card: Ds::Structures::Card,
      color_icon: Ds::Visuals::ColorIcon,
      color_picker: Ds::Forms::ColorPicker,
      empty_state: Ds::Feedback::EmptyState,
      form_actions: Ds::Forms::Actions,
      icon: Ds::Visuals::Icon,
      input_error_message: Ds::Forms::InputErrorMessage,
      input_wrapper: Ds::Forms::InputWrapper,
      link_button: Ds::Actions::LinkButton,
      page: Ds::Layouts::Page,
      radio_button: Ds::Forms::RadioButton,
      stack_layout: Ds::Layouts::Stack,
      toast: Ds::Feedback::Toast,
      two_column_layout: Ds::Layouts::TwoColumn
    }

    COMPONENTS.each do |name, component_class|
      define_method name do |*args, **kwargs, &block|
        render component_class.new(*args, **kwargs), &block
      end
    end
  end
end
