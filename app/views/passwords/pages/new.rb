module Passwords
  module Pages
    class New < ApplicationView
      include Phlex::Rails::Helpers::FormWith

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
                card do |card|
                  card.body do
                    request_reset_password_form
                  end
                end
              end
            end
          end
        end
      end

      def request_reset_password_form
        form_with(scope: :password, url: passwords_path, class: "w-full", data: {turbo: false}) do |form|
          stack_layout do
            input_wrapper do
              form.label :email
              input_hint { t(".email_hint") }
              form.email_field :email, autofocus: true
            end

            form_actions do
              form.submit(icon: nil)

              link_button href: sign_in_path, color: :ghost do
                t(".back")
              end
            end
          end
        end
      end
    end
  end
end
