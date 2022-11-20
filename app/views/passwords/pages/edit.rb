module Passwords
  module Pages
    class Edit < ApplicationView
      include Phlex::Rails::Helpers::FormWith

      def initialize(user:)
        @user = user
      end

      private

      attr_reader :user

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
                    reset_password_form
                  end
                end
              end
            end
          end
        end
      end

      def reset_password_form
        form_with(scope: :password_reset, url: [user, :password, token: user.confirmation_token], method: :put, class: "w-full") do |form|
          stack_layout do
            input_wrapper do
              form.label :password
              input_hint { t(".password_hint") }
              form.password_field :password, autofocus: true
            end

            form_actions do
              form.submit(icon: nil)
            end
          end
        end
      end
    end
  end
end
