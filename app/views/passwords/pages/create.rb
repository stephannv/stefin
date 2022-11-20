module Passwords
  module Pages
    class Create < ApplicationView
      private

      def template
        render App::Base.new do
          render App::Shell.new(title: t(".page_title"), render_sidebar: false) do
            page(size: :xs) do |page|
              div class: "w-full flex justify-center py-6" do
                img src: helpers.image_path("light-logo.svg"), class: "w-1/3"
              end

              page.header do
                page.title { t(".page_title") }
              end

              page.body do
                empty_state do |empty_state|
                  empty_state.image(src: helpers.image_url("email-sent.svg"))

                  empty_state.title { t(".email_sent") }

                  empty_state.description { t(".description") }
                end
              end
            end
          end
        end
      end
    end
  end
end
