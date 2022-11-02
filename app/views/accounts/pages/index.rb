module Accounts
  module Pages
    class Index < ApplicationView
      private

      def template
        render App::Base.new do
          render App::Shell.new(title: t(".page_title")) do
            page do |page|
              page.title { t(".page_title") }
              page.body do
                a(href: new_account_path, class: "btn") { t(".new_account") }
              end
            end
          end
        end
      end
    end
  end
end
