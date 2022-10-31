module Layouts
  class Navbar < ApplicationView
    def template(&content)
      div class: "navbar bg-base-100" do
        div class: "flex-none" do
          label for: "drawer-toggle", class: "btn btn-square btn-ghost lg:hidden" do
            render Icon.new(name: :menu)
          end
        end

        div class: "flex-1" do
          span(class: "text-xl font-bold truncate ml-2 lg:ml-4", href: root_path) { "Stefin" }
        end
      end
    end
  end
end
