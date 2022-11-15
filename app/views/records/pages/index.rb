module Records
  module Pages
    class Index < ApplicationView
      def initialize(records:)
        @records = records
      end

      private

      attr_reader :records

      def template
        render App::Base.new do
          render App::Shell.new(title: t(".page_title")) do
            page(size: :lg) do |page|
              breadcrumbs

              page.header do
                page.title { t(".page_title") }
                page.actions do
                  new_button
                end
              end

              page.body do
                if records.empty?
                  render Records::Components::EmptyState.new
                else
                  record_list
                end
              end
            end
          end
        end
      end

      def breadcrumbs
        render Records::Components::Breadcrumbs.new do
          breadcrumb_item do
            t(".list")
          end
        end
      end

      def new_button
        return if records.empty?

        link_button color: :primary, size: :sm, href: new_record_path do
          icon(name: :add, class: "w-4 h-4")
          text t(".new_record")
        end
      end

      def record_list
        div class: "flex flex-col gap-2" do
          records.each do |record|
            render Records::Components::Card.new(record: record)
          end
        end
      end
    end
  end
end
