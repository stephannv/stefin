module Ds
  class TwoColumnLayout < Ds::Base
    private

    def template(&content)
      div class: "grid grid-cols-2 gap-2", &content
    end
  end
end
