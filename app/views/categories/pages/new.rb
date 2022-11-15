module Categories
  module Pages
    class New < ApplicationView
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
          breadcrumb_item do
            t(".new")
          end
        end
      end
    end
  end
end
