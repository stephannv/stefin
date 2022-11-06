module App
  class Sidebar < ApplicationView
    private

    def template(&content)
      ul class: "menu w-80 bg-base-100 border-r-2 border-neutral-content" do
        records_menu_item
        accounts_menu_item
        categories_menu_item
      end
    end

    def records_menu_item
      menu_item(url: records_path, active: current_controller?(RecordsController)) do
        icon(name: :banknotes)
        span { t(".records") }
      end
    end

    def accounts_menu_item
      menu_item(url: accounts_path, active: current_controller?(AccountsController)) do
        icon(name: :credit_card)
        span { t(".accounts") }
      end
    end

    def categories_menu_item
      menu_item(url: categories_path, active: current_controller?(CategoriesController)) do
        icon(name: :tag)
        span { t(".categories") }
      end
    end

    def menu_item(url:, active:, &content)
      li class: "font-semibold hover-bordered" do
        a href: url, class: active ? "active" : nil do
          yield_content(&content)
        end
      end
    end
  end
end
