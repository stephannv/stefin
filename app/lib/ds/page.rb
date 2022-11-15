module Ds
  class Page < Ds::Base
    SIZE_CLASSES = {
      base: "w-full md:w-3/4 lg:w-2/3 xl:w-1/2",
      lg: "w-full md:w-5/6 lg:w-4/5 xl:w-3/4 2xl:w-2/3"
    }.freeze

    def initialize(size: :base)
      @size = size
    end

    def header(&content)
      div class: "flex flex-row justify-between", &content
    end

    def title(&content)
      h1 class: "flex-1 text-2xl", &content
    end

    def actions(&content)
      div(&content)
    end

    def body(&content)
      div(&content)
    end

    private

    attr_reader :size

    def template(&content)
      div class: tokens("flex flex-col gap-4 mx-auto p-3 md:p-6 my-4", SIZE_CLASSES[size]), &content
    end
  end
end
