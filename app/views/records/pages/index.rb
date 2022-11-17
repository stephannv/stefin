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
                  render Records::Components::List.new(records: records)
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
    end
  end
end
