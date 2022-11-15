module Accounts
  module Pages
    class New < ApplicationView
      def initialize(account:)
        @account = account
      end

      private

      attr_reader :account

      def template
        render App::Base.new do
          render App::Shell.new(title: t(".page_title")) do
            page do |page|
              breadcrumbs

              page.header do
                page.title { t(".page_title") }
              end

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

      def breadcrumbs
        render Accounts::Components::Breadcrumbs.new do
          breadcrumb_item do
            t(".new")
          end
        end
      end
    end
  end
end
