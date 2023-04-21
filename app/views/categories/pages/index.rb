module Categories
  module Pages
    class Index < ApplicationView
      def initialize(categories:)
        @categories = categories
      end

      private

      attr_reader :categories

      def template
        render App::Base.new do
          render App::Shell.new(title: t(".page_title")) do
            page do |page|
              breadcrumbs

              page.header do
                page.title { t(".page_title") }
                page.actions do
                  new_button
                end
              end

              page.body do
                if categories.empty?
                  render Categories::Components::EmptyState.new
                else
                  category_list
                end
              end
            end
          end
        end
      end

      def breadcrumbs
        render Categories::Components::Breadcrumbs.new do
          breadcrumb_item do
            t(".list")
          end
        end
      end

      def new_button
        return if categories.empty?

        link_button href: new_category_path, size: :sm, color: :primary do
          icon(name: :add, size: "w-4 h-4")
          plain t(".new_category")
        end
      end

      def category_list
        div class: "flex flex-col gap-2" do
          categories.each do |category|
            render Categories::Components::Card.new(category: category)
          end
        end
      end
    end
  end
end
