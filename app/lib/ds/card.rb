module Ds
  class Card < Ds::Base
    DEFAULT_CLASSES = "bg-base-100 border shadow-sm rounded-lg"

    def initialize(hover: false, **html_options)
      @html_options = html_options
      @hover = hover
    end

    def body(padding: "p-4", &content)
      div class: padding, &content
    end

    private

    attr_reader :html_options

    def template(&content)
      div(**mix(html_options, {class: build_classes}), &content)
    end

    def build_classes
      tokens(DEFAULT_CLASSES, hover?: "transition-all cursor-pointer hover:shadow-md")
    end

    def hover? = @hover
  end
end
