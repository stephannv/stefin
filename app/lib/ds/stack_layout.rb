module Ds
  class StackLayout < Ds::Base
    DEFAULT_ATTRIBUTES = {class: "flex flex-col gap-4"}

    def initialize(**html_options)
      @html_options = html_options
    end

    private

    attr_reader :html_options

    def template(&content)
      div class: "flex flex-col gap-4" do
        yield_content(&content)
      end
    end
  end
end
