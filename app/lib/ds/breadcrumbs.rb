module Ds
  class Breadcrumbs < Ds::Base
    private

    def template(&content)
      div class: "text-sm breadcrumbs" do
        ul do
          yield_content(&content)
        end
      end
    end
  end
end
