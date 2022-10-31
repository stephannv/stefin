module Layout
  class Shell < ApplicationView
    def template(&content)
      div class: "drawer drawer-mobile" do
        input id: "drawer-toggle", type: "checkbox", class: "drawer-toggle"

        div class: "drawer-content" do
          div class: "flex flex-col min-h-screen" do
            navbar

            content(&content)
          end
        end

        sidebar
      end
    end

    private

    def navbar
      div class: "sticky top-0 left-0 z-30" do
        render Layout::Navbar.new
      end
    end

    def sidebar
      div class: "drawer-side" do
        label for: "drawer-toggle", class: "drawer-overlay"

        render Layout::Sidebar.new
      end
    end

    def content(&content)
      div class: "flex grow" do
        yield_content(&content)
      end
    end
  end
end
