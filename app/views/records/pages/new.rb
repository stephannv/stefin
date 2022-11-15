module Records
  module Pages
    class New < ApplicationView
      def initialize(record:, accounts:, categories:)
        @record = record
        @accounts = accounts
        @categories = categories
      end

      private

      attr_reader :record, :accounts, :categories

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
                    render Records::Components::Form.new(record: record, accounts: accounts, categories: categories)
                  end
                end
              end
            end
          end
        end
      end

      def breadcrumbs
        render Records::Components::Breadcrumbs.new do
          breadcrumb_item do
            t(".new")
          end
        end
      end
    end
  end
end
