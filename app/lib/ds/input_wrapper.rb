module Ds
  class InputWrapper < Ds::Base
    def template(&content)
      div class: "form-control w-full", &content
    end
  end
end
