module Ds
  module Helpers
    COMPONENTS = {
      breadcrumbs: Ds::Breadcrumbs,
      breadcrumb_item: Ds::BreadcrumbItem,
      card: Ds::Card,
      color_icon: Ds::ColorIcon,
      color_picker: Ds::ColorPicker,
      empty_state: Ds::EmptyState,
      form_actions: Ds::FormActions,
      icon: Ds::Icon,
      input_error: Ds::InputError,
      input_wrapper: Ds::InputWrapper,
      link_button: Ds::LinkButton,
      page: Ds::Page,
      radio: Ds::Radio,
      stack_layout: Ds::StackLayout,
      toast: Ds::Toast,
      two_column_layout: Ds::TwoColumnLayout
    }

    COMPONENTS.each do |name, component_class|
      define_method name do |*args, **kwargs, &block|
        render component_class.new(*args, **kwargs), &block
      end
    end
  end
end
