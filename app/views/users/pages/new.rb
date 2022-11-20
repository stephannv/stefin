module Users
  module Pages
    class New < ApplicationView
      include Phlex::Rails::Helpers::FormWith

      def initialize(user:)
        @user = user
      end

      private

      attr_reader :user

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
                    sign_up_form
                  end
                end
              end
            end
          end
        end
      end

      def sign_up_form
        form_with(model: user, class: "w-full", data: {turbo: false}) do |form|
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

              link_button href: sign_in_path, color: :ghost do
                t(".sign_in")
              end
            end
          end
        end
      end
    end
  end
end
