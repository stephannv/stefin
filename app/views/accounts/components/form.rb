module Accounts
  module Components
    class Form < ApplicationView
      include Phlex::Rails::Helpers::FormWith

      def initialize(account:)
        @account = account
      end

      private

      attr_reader :account

      def template
        form_with(model: account, class: "w-full") do |form|
          stack_layout do
            input_wrapper do
              form.label :title
              form.text_field :title
            end

            input_wrapper do
              form.label :color
              form.text_field :color
            end

            form_actions do
              form.submit
              link_button color: :ghost, href: accounts_path do
                t(".cancel")
              end
            end
          end
        end
      end
    end
  end
end
