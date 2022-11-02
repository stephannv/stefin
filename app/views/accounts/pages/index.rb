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
              page.title { t(".page_title") }

              page.body do
                div class: "flex flex-col gap-2" do
                  div class: "flex justify-end py-2" do
                    link_button href: new_account_path, color: :primary do
                      t(".new_account")
                    end
                  end

                  accounts.each do |account|
                    render Accounts::Components::Card.new(account: account)
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
