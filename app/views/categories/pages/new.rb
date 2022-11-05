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
              page.title { t(".page_title") }

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
    end
  end
end
