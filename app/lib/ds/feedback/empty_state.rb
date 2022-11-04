module Ds
  module Feedback
    class EmptyState < Ds::Base
      def title(&content)
        div class: "text-xl font-bold text-center", &content
      end

      def description(&content)
        div class: "text-center", &content
      end

      def actions(&content)
        div class: "flex pt-4 justify-center", &content
      end

      private

      def template(&content)
        div class: "bg-base-100 border-dashed border-[4px] border-primary p-8", &content
      end
    end
  end
end
