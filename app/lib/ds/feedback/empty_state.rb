module Ds
  module Feedback
    class EmptyState < Ds::Base
      def title(&content)
        div class: "text-xl font-bold text-center", &content
      end

      def description(&content)
        div class: "text-center font-light", &content
      end

      def actions(&content)
        div class: "flex pt-4 justify-center", &content
      end

      private

      def template(&content)
        div class: "border-dashed border-2 border-gray-600 rounded-xl p-8", &content
      end
    end
  end
end
