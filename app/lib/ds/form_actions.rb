module Ds
  class FormActions < Ds::Base
    private

    def template(&content)
      div class: "flex flex-col gap-4 pt-4", &content
    end
  end
end
