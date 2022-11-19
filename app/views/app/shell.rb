module App
  class Shell < ApplicationView
    def initialize(title: "", render_sidebar: true)
      @title = title
      @render_sidebar = render_sidebar
    end

    private

    attr_reader :title

    def template(&content)
      div class: "drawer drawer-mobile" do
        input id: "drawer-toggle", type: "checkbox", class: "drawer-toggle"

        div class: "drawer-content bg-base-200" do
          div class: "flex flex-col min-h-screen" do
            navbar

            content(&content)
          end
        end

        sidebar if render_sidebar?
      end
    end

    def navbar
      div class: "sticky top-0 left-0 z-30" do
        render App::Navbar.new(title: title)
      end
    end

    def sidebar
      div class: "drawer-side bg-base-100" do
        label for: "drawer-toggle", class: "drawer-overlay"

        render App::Sidebar.new
      end
    end

    def content(&content)
      div class: "flex grow items-start" do
        yield_content(&content)
      end
    end

    def render_sidebar? = @render_sidebar
  end
end
