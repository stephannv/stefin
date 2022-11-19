module Ds
  class InputHint < Ds::Base
    private

    def template(&content)
      span class: "text-sm -mt-1 px-1 pb-1 text-slate-500", &content
    end
  end
end
