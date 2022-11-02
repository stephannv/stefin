module Ds
  module Layouts
    class Page < Ds::Base
      def title(&content)
        h1 class: "text-2xl font-bold", &content
      end

      def body(&content)
        div(&content)
      end

      private

      def template(&content)
        div class: "flex flex-col gap-5 w-full md:w-3/4 lg:w-2/3 xl:w-1/2 mx-auto p-6 my-6 bg-base-200 lg:border lg:border-slate-700 lg:rounded-xl", &content
      end
    end
  end
end
