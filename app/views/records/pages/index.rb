module Records
  module Pages
    class Index < ApplicationView
      private

      def template
        render App::Base.new do
          render App::Shell.new(title: t(".page_title")) do
            page do |page|
              page.title { t(".page_title") }

              page.body do
                card do |card|
                  card.body do
                    link_button color: :primary, href: new_record_path do
                      t(".new_record")
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
end
