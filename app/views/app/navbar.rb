module App
  class Navbar < ApplicationView
    def initialize(title: "")
      @title = title
    end

    private

    attr_reader :title

    def template(&content)
      div class: "navbar bg-base-100" do
        div class: "flex-none" do
          label for: "drawer-toggle", class: "btn btn-square btn-ghost lg:hidden" do
            icon(name: :menu)
          end
        end

        div class: "flex-1" do
          span(class: "text-xl font-bold truncate ml-2 lg:ml-4", href: root_path) { title }
        end
      end
    end
  end
end