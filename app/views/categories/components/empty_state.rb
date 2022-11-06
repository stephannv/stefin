module Categories
  module Components
    class EmptyState < ApplicationView
      private

      def template
        empty_state do |empty_state|
          empty_state.image(src: helpers.image_url("categories-empty-state.webp"))

          empty_state.title { t(".title") }

          empty_state.description { t(".description") }

          empty_state.actions do
            link_button href: new_category_path, color: :primary do
              t(".new_category")
            end
          end
        end
      end
    end
  end
end
