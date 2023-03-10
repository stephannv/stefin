module Accounts
  module Components
    class Breadcrumbs < ApplicationView
      private

      def template(&content)
        breadcrumbs do
          breadcrumb_item(href: accounts_path) do |i|
            i.icon(name: :wallet)
            i.plain t(".accounts")
          end

          yield_content(&content)
        end
      end
    end
  end
end
