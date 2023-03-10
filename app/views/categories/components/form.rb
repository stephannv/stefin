module Categories
  module Components
    class Form < ApplicationView
      include Phlex::Rails::Helpers::FormWith

      def initialize(category:)
        @category = category
      end

      private

      attr_reader :category

      def template
        form_with(model: category, class: "w-full") do |form|
          stack_layout do
            input_wrapper do
              form.label :title
              form.text_field :title, autofocus: true
            end

            input_wrapper do
              form.label :color
              form.color_field :color
            end

            form_actions do
              form.submit

              link_button href: categories_path, color: :ghost do
                icon(name: :chevron_left, size: "w-5 h-5")
                plain t(".cancel")
              end
            end
          end
        end
      end
    end
  end
end
