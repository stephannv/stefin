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
            card.body do
              div class: "flex flex-row justify-between" do
                div class: "flex gap-4 items-center" do
                  color_icon value: account.color
                  plain account.title
                end
                div class: "font-medium text-slate-500" do
                  account.balance.format
                end
              end
            end
          end
        end
      end
    end
  end
end
