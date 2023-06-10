module Transfers
  module Pages
    class New < ApplicationView
      def initialize(transfer:, accounts:)
        @transfer = transfer
        @accounts = accounts
      end

      private

      attr_reader :transfer, :accounts

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
                    render Transfers::Components::Form.new(transfer: transfer, accounts: accounts)
                  end
                end
              end
            end
          end
        end
      end

      def breadcrumbs
        render Transfers::Components::Breadcrumbs.new do
          breadcrumb_item do
            t(".new")
          end
        end
      end
    end
  end
end
