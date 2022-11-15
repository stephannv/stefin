module Ds
  class BreadcrumbItem < Ds::Base
    BASE_CLASSES = "flex flex-row items-center gap-2"

    def initialize(href: nil)
      @href = href
    end

    def icon(**options)
      super(**options.merge(size: "w-4 h-4"))
    end

    def color_icon(**options)
      super(**options.merge(size: "w-4 h-4"))
    end

    private

    attr_reader :href

    def template(&content)
      content_wrapper(&content)
    end

    def content_wrapper(&content)
      if href.present?
        li do
          a href: href, class: BASE_CLASSES, &content
        end
      else
        li class: BASE_CLASSES, &content
      end
    end
  end
end
