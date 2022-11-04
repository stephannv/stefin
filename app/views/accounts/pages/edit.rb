module Accounts
  module Pages
    class Edit < ApplicationView
      def initialize(account:)
        @account = account
      end

      private

      attr_reader :account

      def template
        render App::Base.new do
          render App::Shell.new(title: t(".page_title")) do
            page do |page|
              page.title { t(".page_title") }

              page.body do
                card do |card|
                  card.body do
                    render Accounts::Components::Form.new(account: account)
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
