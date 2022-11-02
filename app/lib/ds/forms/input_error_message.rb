module Ds
  module Forms
    class InputErrorMessage < Ds::Base
      private

      def template(&content)
        label class: "label" do
          span class: "label-text-alt text-rose-400", &content
        end
      end
    end
  end
end
