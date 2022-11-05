module Accounts
  module Components
    class Card < ApplicationView
      def initialize(account:)
        @account = account
      end

      private

      attr_reader :account

      def template
        card(compact: true) do |card|
          card.title do
            div class: "flex items-center justify-between w-full p-4" do
              div class: "flex gap-2 items-center" do
                color_icon value: account.color
                text account.title
              end

              div do
                link_button(color: :ghost, square: true, href: edit_account_path(account), title: t(".edit")) do
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
