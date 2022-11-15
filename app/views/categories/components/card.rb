module Categories
  module Components
    class Card < ApplicationView
      def initialize(category:)
        @category = category
      end

      private

      attr_reader :category

      def template
        a href: edit_category_path(category) do
          card(hover: true) do |card|
            card.body do
              div class: "flex gap-4 items-center" do
                color_icon value: category.color
                text category.title
              end
            end
          end
        end
      end
    end
  end
end
