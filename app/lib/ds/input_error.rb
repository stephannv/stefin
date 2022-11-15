module Ds
  class InputError < Ds::Base
    private

    def template(&content)
      label class: "label" do
        span class: "label-text-alt text-error", &content
      end
    end
  end
end
