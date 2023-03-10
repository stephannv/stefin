module Accounts
  module Pages
    class Index < ApplicationView
      def initialize(accounts:)
        @accounts = accounts
      end

      private

      attr_reader :accounts

      def template
        render App::Base.new do
          render App::Shell.new(title: t(".page_title")) do
            page do |page|
              breadcrumbs

              page.header do
                page.title { t(".page_title") }
                page.actions do
                  new_button
                end
              end

              page.body do
                if accounts.empty?
                  render Accounts::Components::EmptyState.new
                else
                  account_list
                end
              end
            end
          end
        end
      end

      def breadcrumbs
        render Accounts::Components::Breadcrumbs.new do
          breadcrumb_item do
            t(".list")
          end
        end
      end

      def new_button
        return if accounts.empty?

        link_button href: new_account_path, size: :sm, color: :primary do
          icon(name: :add, size: "w-4 h-4")
          plain t(".new_account")
        end
      end

      def account_list
        div class: "flex flex-col gap-2" do
          accounts.each do |account|
            render Accounts::Components::Card.new(account: account)
          end
        end
      end
    end
  end
end
