module Ds
  module Forms
    class InputErrorMessage < Ds::Base
      private

      def template(&content)
        label class: "label" do
          span class: "label-text-alt text-error font-bold", &content
        end
      end
    end
  end
end
