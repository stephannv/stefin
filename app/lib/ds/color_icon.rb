module Ds
  class ColorIcon < Ds::Base
    def initialize(value:, size: "w-6 h-6")
      @value = value
      @size = size
    end

    private

    attr_reader :value, :size

    def template
      div class: tokens("rounded-full", size), style: "background-color: #{value}"
    end
  end
end
