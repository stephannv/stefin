module App
  class Sidebar < ApplicationView
    private

    def template(&content)
      ul class: "menu w-80 bg-base-300 text-white  justify-between" do
        div do
          logo

          div do
            records_menu_item
            accounts_menu_item
            categories_menu_item
          end
        end

        div do
          sign_out_menu_item
        end
      end
    end

    def logo
      div class: "w-80 bg-base-300 text-white flex justify-center py-8" do
        img src: helpers.image_path("dark-logo.svg"), class: "w-1/2 justify-self-center"
      end
    end

    def records_menu_item
      menu_item(url: records_path, active: current_controller?(RecordsController)) do
        icon(name: :list_check)
        span { t(".records") }
      end
    end

    def accounts_menu_item
      menu_item(url: accounts_path, active: current_controller?(AccountsController)) do
        icon(name: :wallet)
        span { t(".accounts") }
      end
    end

    def categories_menu_item
      menu_item(url: categories_path, active: current_controller?(CategoriesController)) do
        icon(name: :tag)
        span { t(".categories") }
      end
    end

    def sign_out_menu_item
      menu_item(url: sign_out_path, active: false, data: {turbo_method: :delete}) do
        icon(name: :logout)
        span { t(".sign_out") }
      end
    end

    def menu_item(url:, active:, **html_options, &content)
      li class: "hover-bordered" do
        a href: url, class: (active ? "active" : nil), **html_options do
          yield_content(&content)
        end
      end
    end
  end
end
