module Ds
  class Page < Ds::Base
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

    def template(&content)
      div class: "flex flex-col gap-4 w-full md:w-3/4 lg:w-2/3 xl:w-1/2 mx-auto p-3 md:p-6 my-4", &content
    end
  end
end
