module Ds
  module Layouts
    class Page < Ds::Base
      def title(&content)
        h1 class: "w-fit text-3xl font-black border-b-[8px] border-secondary my-2", &content
      end

      def body(&content)
        div(&content)
      end

      private

      def template(&content)
        div class: "flex flex-col gap-5 w-full md:w-3/4 lg:w-2/3 xl:w-1/2 mx-auto p-3 md:p-6 my-4", &content
      end
    end
  end
end
