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
                form.ds_radio_button :group, RecordGroups::EXPENSE do
                  RecordGroups.t(RecordGroups::EXPENSE)
                end
                form.ds_radio_button :group, RecordGroups::INCOME do
                  RecordGroups.t(RecordGroups::INCOME)
                end
              end

              form.ds_errors(:group)
            end

            two_column_layout do
              input_wrapper do
                form.ds_label(:account_id)
                form.ds_collection_select(:account_id, accounts, :id, :title)
              end

              input_wrapper do
                form.ds_label(:category_id)
                form.ds_collection_select(:category_id, categories, :id, :title)
              end
            end

            two_column_layout do
              input_wrapper do
                form.ds_label(:amount_cents)
                form.ds_money_field(:amount_cents)
              end

              input_wrapper do
                form.ds_label(:occurred_on)
                form.ds_date_field(:occurred_on)
              end
            end

            input_wrapper do
              form.ds_label(:description)
              form.ds_text_field(:description)
            end

            form_actions do
              form.ds_submit
              link_button color: :ghost, href: records_path do
                t(".cancel")
              end
            end
          end
        end
      end
    end
  end
end
