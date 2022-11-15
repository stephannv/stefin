module Categories
  module Pages
    class Edit < ApplicationView
      def initialize(category:)
        @category = category
      end

      private

      attr_reader :category

      def template
        render App::Base.new do
          render App::Shell.new(title: t(".page_title")) do
            page do |page|
              breadcrumbs

              page.header do
                page.title { t(".page_title") }
                page.actions do
                  destroy_button
                end
              end

              page.body do
                card do |card|
                  card.body do
                    render Categories::Components::Form.new(category: category)
                  end
                end
              end
            end
          end
        end
      end

      def breadcrumbs
        render Categories::Components::Breadcrumbs.new do
          breadcrumb_item do |i|
            i.color_icon(value: category.color)
            i.text category.title
          end

          breadcrumb_item do
            t(".edit")
          end
        end
      end

      def destroy_button
        link_button(
          href: category_path(category),
          color: :error,
          size: :sm,
          data: {turbo_method: :delete, turbo_confirm: t(".destroy_confirm")}
        ) do
          icon(name: :trash, size: "w-4 h-4")
          text t(".destroy")
        end
      end
    end
  end
end
