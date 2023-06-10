module Transfers
  module Components
    class Form < ApplicationView
      include Phlex::Rails::Helpers::FormWith

      def initialize(transfer:, accounts:)
        @transfer = transfer
        @accounts = accounts
      end

      private

      attr_reader :transfer, :accounts

      def template
        form_with(model: transfer, class: "w-full") do |form|
          stack_layout do
            two_column_layout do
              input_wrapper do
                form.label(:from_account_id)
                form.collection_select(:from_account_id, accounts, :id, :title)
              end

              input_wrapper do
                form.label(:to_account_id)
                form.collection_select(:to_account_id, accounts, :id, :title)
              end
            end

            two_column_layout do
              input_wrapper do
                form.label(:amount_cents)
                form.money_field(:amount_cents)
              end

              input_wrapper do
                form.label(:occurred_on)
                form.date_field(:occurred_on)
              end
            end

            input_wrapper do
              form.label(:description)
              form.text_field(:description)
            end

            form_actions do
              form.submit

              link_button color: :ghost, href: records_path do
                icon name: :chevron_left, size: "w-5 h-5"
                plain t(".cancel")
              end
            end
          end
        end
      end
    end
  end
end
