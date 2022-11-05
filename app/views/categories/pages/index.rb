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
              page.title { t(".page_title") }

              page.body do
                if categories.empty?
                  render Categories::Components::EmptyState.new
                else
                  categories_list
                end
              end
            end
          end
        end
      end

      def categories_list
        div class: "flex flex-col gap-2" do
          div class: "flex justify-end py-2" do
            link_button href: new_category_path, color: :primary do
              t(".new_category")
            end
          end

          categories.each do |category|
            render Categories::Components::Card.new(category: category)
          end
        end
      end
    end
  end
end
