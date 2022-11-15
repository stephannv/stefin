module Accounts
  module Components
    class Card < ApplicationView
      def initialize(account:)
        @account = account
      end

      private

      attr_reader :account

      def template
        a href: edit_account_path(account) do
          card(hover: true) do |card|
            card.body(padding: "px-4 py-6") do
              div class: "flex gap-4 items-center" do
                color_icon value: account.color
                text account.title
              end
            end
          end
        end
      end
    end
  end
end
