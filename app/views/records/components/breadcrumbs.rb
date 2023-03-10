module Records
  module Components
    class Breadcrumbs < ApplicationView
      private

      def template(&content)
        breadcrumbs do
          breadcrumb_item(href: records_path) do |i|
            i.icon(name: :list_check)
            i.plain t(".records")
          end

          yield_content(&content)
        end
      end
    end
  end
end
