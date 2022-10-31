module Layout
  class Sidebar < ApplicationView
    def template(&content)
      ul class: "menu w-80 bg-base-100 text-base-content border-r border-gray-700" do
        accounts_menu_item
      end
    end

    private

    def accounts_menu_item
      menu_item(url: accounts_path, active: current_controller?(AccountsController)) do
        render Icon.new(name: :credit_card)
        span { t(".accounts") }
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
