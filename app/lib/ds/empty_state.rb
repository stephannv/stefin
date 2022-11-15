module Ds
  class EmptyState < Ds::Base
    def image(src: nil)
      div class: "flex items-center justify-center p-4" do
        img src: src, class: "w-1/3"
      end
    end

    def title(&content)
      div class: "text-xl font-medium text-center", &content
    end

    def description(&content)
      div class: "text-center", &content
    end

    def actions(&content)
      div class: "flex pt-4 justify-center", &content
    end

    private

    def template(&content)
      div class: "flex flex-col gap-2 bg-base-100 p-8 border shadow rounded-lg", &content
    end
  end
end
