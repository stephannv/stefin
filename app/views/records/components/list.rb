module Records
  module Components
    class List < ApplicationView
      def initialize(records:)
        @records = records
      end

      private

      attr_reader :records

      def template
        div class: "flex flex-col gap-4" do
          grouped_records_by_date.each do |date, records|
            div class: "flex flex-col gap-2", data: {qa: date.iso8601} do
              div class: "font-semibold" do
                helpers.l(date, format: :short)
              end
              records.each do |record|
                render Records::Components::Card.new(record: record)
              end
            end
          end
        end
      end

      def grouped_records_by_date
        records.group_by(&:occurred_on)
      end
    end
  end
end
