module Records
  module Pages
    class Index < ApplicationView
      private

      def template
        render App::Base.new do
          render App::Shell.new(title: t(".page_title")) do
            page do |page|
              breadcrumbs

              page.header do
                page.title { t(".page_title") }
                page.actions do
                  link_button color: :primary, size: :sm, href: new_record_path do
                    icon(name: :add, class: "w-4 h-4")
                    text t(".new_record")
                  end
                end
              end

              page.body do
                card do |card|
                  card.body do
                  end
                end
              end
            end
          end
        end
      end

      def breadcrumbs
        render Records::Components::Breadcrumbs.new do
          breadcrumb_item do
            t(".list")
          end
        end
      end
    end
  end
end
