module Ds
  module Layouts
    class Stack < Ds::Base
      private

      def template(&content)
        div class: "flex flex-col gap-4", &content
      end
    end
  end
end
