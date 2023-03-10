module Records
  module Pages
    class Edit < ApplicationView
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
                page.actions do
                  destroy_button
                end
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
            t(".edit")
          end
        end
      end

      def destroy_button
        link_button(
          href: record_path(record),
          color: :error,
          size: :sm,
          data: {turbo_method: :delete, turbo_confirm: t(".destroy_confirm")}
        ) do
          icon(name: :trash, size: "w-4 h-4")
          plain t(".destroy")
        end
      end
    end
  end
end
