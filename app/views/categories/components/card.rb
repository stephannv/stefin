module Categories
  module Components
    class Card < ApplicationView
      def initialize(category:)
        @category = category
      end

      private

      attr_reader :category

      def template
        card do |card|
          card.title do
            div class: "flex items-center justify-between w-full p-4" do
              div class: "flex gap-2 items-center" do
                color_icon value: category.color
                text category.title
              end

              div do
                link_button(color: :ghost, square: true, href: edit_category_path(category), title: t(".edit")) do
                  icon(name: :pencil_square)
                end
              end
            end
          end
        end
      end
    end
  end
end
