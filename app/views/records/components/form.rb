module Records
  module Components
    class Form < ApplicationView
      include Phlex::Rails::Helpers::FormWith

      def initialize(record:, accounts:, categories:)
        @record = record
        @accounts = accounts
        @categories = categories
      end

      private

      attr_reader :record, :accounts, :categories

      def template
        form_with(model: record, class: "w-full") do |form|
          stack_layout do
            input_wrapper do
              two_column_layout do
                form.radio_button :group, RecordGroups::EXPENSE do
                  RecordGroups.t(RecordGroups::EXPENSE)
                end
                form.radio_button :group, RecordGroups::INCOME do
                  RecordGroups.t(RecordGroups::INCOME)
                end
              end

              form.errors(:group)
            end

            two_column_layout do
              input_wrapper do
                form.label(:account_id)
                form.collection_select(:account_id, accounts, :id, :title)
              end

              input_wrapper do
                form.label(:category_id)
                form.collection_select(:category_id, categories, :id, :title)
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
                text t(".cancel")
              end
            end
          end
        end
      end
    end
  end
end
