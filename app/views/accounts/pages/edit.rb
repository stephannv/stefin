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
          breadcrumb_item do |i|
            i.color_icon(value: account.color)
            i.plain account.title
          end

          breadcrumb_item do
            t(".edit")
          end
        end
      end

      def destroy_button
        link_button(
          href: account_path(account),
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
