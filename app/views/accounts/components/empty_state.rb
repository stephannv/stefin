module Accounts
  module Components
    class EmptyState < ApplicationView
      private

      def template
        empty_state do |empty_state|
          empty_state.image(src: helpers.image_url("accounts-empty-state.webp"))

          empty_state.title { t(".title") }

          empty_state.description { t(".description") }

          empty_state.actions do
            link_button href: new_account_path, color: :primary do
              t(".new_account")
            end
          end
        end
      end
    end
  end
end
