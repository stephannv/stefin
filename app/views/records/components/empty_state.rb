module Records
  module Components
    class EmptyState < ApplicationView
      private

      def template
        empty_state do |empty_state|
          empty_state.image(src: helpers.image_url("records-empty-state.svg"))

          empty_state.title { t(".title") }

          empty_state.description { t(".description") }

          empty_state.actions do
            link_button href: new_record_path, color: :primary do
              icon(name: :add, size: "w-6 h-6")
              text t(".new_record")
            end
          end
        end
      end
    end
  end
end
