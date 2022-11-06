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
              form.ds_label :title
              form.ds_text_field :title
            end

            input_wrapper do
              form.ds_label :color
              form.ds_color_field :color
            end

            form_actions do
              form.ds_submit

              destroy_button if account.persisted?

              link_button href: accounts_path, color: :ghost do
                t(".cancel")
              end
            end
          end
        end
      end

      def destroy_button
        link_button href: account_path(account),
          color: :error,
          data: {turbo_method: :delete, turbo_confirm: t(".destroy_confirm")} do
          t(".destroy")
        end
      end
    end
  end
end
