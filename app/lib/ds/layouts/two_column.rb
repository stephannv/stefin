module Ds
  module Layouts
    class TwoColumn < Ds::Base
      private

      def template(&content)
        div class: "grid grid-cols-2 gap-2", &content
      end
    end
  end
end
