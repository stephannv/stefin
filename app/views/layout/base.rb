module Layout
  class Base < ApplicationView
    include Phlex::Rails::Layout

    def template(&content)
      doctype

      html do
        head do
          title { "Stefin" }

          meta name: "viewport", content: "width=device-width,initial-scale=1"
          csrf_meta_tags
          csp_meta_tag

          stylesheet_link_tag "application", "data-turbo-track": "reload"
          javascript_include_tag "application", "data-turbo-track": "reload", defer: true
        end

        body class: "bg-base-300" do
          yield_content(&content)
        end
      end
    end
  end
end
