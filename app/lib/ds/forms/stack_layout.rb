module Ds
  module Forms
    class StackLayout < Ds::Base
      private

      def template(&content)
        div class: "flex flex-col gap-4", &content
      end
    end
  end
end
