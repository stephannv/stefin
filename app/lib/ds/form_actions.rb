module Ds
  class FormActions < Ds::Base
    private

    def template(&content)
      div class: "flex flex-col gap-3 pt-4", &content
    end
  end
end
