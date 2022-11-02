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
          card.body do
            card.title do
              div class: "flex items-center justify-between w-full" do
                div class: "pl-2" do
                  account.title
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
end
