module Ds
  class InputWrapper < Ds::Base
    def template(&content)
      div class: "form-control w-full flex flex-col gap-0.5", &content
    end
  end
end
