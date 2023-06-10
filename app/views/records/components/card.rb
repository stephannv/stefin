module Records
  module Components
    class Card < ApplicationView
      def initialize(record:)
        @record = record
        @account = record.account
        @category = record.category
      end

      private

      attr_reader :record, :account, :category

      def template
        a href: edit_record_path(record) do
          card(hover: true) do |card|
            card.body do
              div class: "grid grid-cols-12 gap-4 items-center" do
                div class: "col-span-6 lg:col-span-7 xl:col-span-8 2xl:col-span-10" do
                  categorization_section
                end

                div class: "col-span-6 lg:col-span-5 xl:col-span-4 2xl:col-span-2" do
                  amount_section
                end
              end
            end
          end
        end
      end

      def categorization_section
        div class: "flex flex-row items-center gap-3" do
          if record.transfer_id?
            icon(name: :swap, size: "w-8 h-8 lg:w-8 lg:h-8 aspect-square")
          else
            color_icon(value: category.color, size: "w-8 h-8 lg:w-8 lg:h-8 aspect-square")
          end

          div class: "grid grid-cols-12 items-center gap-2 w-full" do
            div class: "col-span-12 lg:col-span-6 flex flex-col" do
              span class: "font-semibold truncate" do
                if record.transfer_id?
                  "TransferTODO"
                else
                  category.title
                end
              end

              div class: "flex flex-row items-center gap-1" do
                color_icon(value: account.color, size: "w-2 h-2")
                plain account.title
              end
            end

            div class: "col-span-6 hidden lg:block flex flex-col gap-1" do
              description_section
            end
          end
        end
      end

      def description_section
        div class: "font-light text-sm truncate" do
          record.payee
        end

        div class: "font-extralight text-xs truncate" do
          record.description
        end
      end

      def amount_section
        div class: "text-right" do
          span class: ["justify-self-end font-bold text-md", amount_text_color] do
            plain amount_symbol
            plain record.amount.format
          end
        end
      end

      def amount_text_color
        case
        when record.transfer?
          "text-base"
        when record.expense?
          "text-error"
        when record.income?
          "text-success"
        end
      end

      def amount_symbol
        record.expense? ? "-" : "+"
      end
    end
  end
end
