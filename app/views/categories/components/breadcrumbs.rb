module Categories
  module Components
    class Breadcrumbs < ApplicationView
      private

      def template(&content)
        breadcrumbs do
          breadcrumb_item(href: categories_path) do |i|
            i.icon(name: :tag)
            i.plain t(".categories")
          end

          yield_content(&content)
        end
      end
    end
  end
end
