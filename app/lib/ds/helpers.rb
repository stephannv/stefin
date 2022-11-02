module Ds
  module Helpers
    COMPONENTS = {
      form_actions: Ds::Forms::Actions,
      icon: Ds::Visuals::Icon,
      input_error_message: Ds::Forms::InputErrorMessage,
      input_wrapper: Ds::Forms::InputWrapper,
      link_button: Ds::Actions::LinkButton,
      page: Ds::Layouts::Page,
      stack_layout: Ds::Forms::StackLayout,
      toast: Ds::Information::Toast
    }

    COMPONENTS.each do |name, component_class|
      define_method name do |*args, **kwargs, &block|
        render component_class.new(*args, **kwargs), &block
      end
    end
  end
end
