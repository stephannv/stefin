module Sessions
  module Pages
    class New < ApplicationView
      include Phlex::Rails::Helpers::FormWith

      private

      def template
        render App::Base.new do
          render App::Shell.new(title: t(".navbar_title"), render_sidebar: false) do
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
                    sign_in_form
                  end
                end
              end
            end
          end
        end
      end

      def sign_in_form
        form_with(scope: :session, url: session_path, class: "w-full", data: {turbo: false}) do |form|
          stack_layout do
            input_wrapper do
              form.label :email
              form.email_field :email, autofocus: true
            end

            input_wrapper do
              form.label :password
              form.password_field :password, autocomplete: "current-password"
            end

            form_actions do
              form.submit(icon: nil)

              if Clearance.configuration.allow_sign_up?
                link_button href: sign_up_path, color: :ghost do
                  t(".sign_up")
                end
              end

              link_button href: new_password_path, color: :ghost do
                t(".forgot_password")
              end
            end
          end
        end
      end
    end
  end
end
