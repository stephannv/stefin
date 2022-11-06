module Ds
  module Forms
    class RadioButton < Ds::Base
      ITEM_CLASSES = "border-[3px] rounded border-primary/20 font-bold text-center p-4 relative"
      INDICATOR_CLASSES = "absolute top-0 left-0 hidden peer-checked:block rounded h-full w-full ring-4 ring-offset-2 ring-primary"

      def initialize(id:, name:, value:, checked: false)
        @id = id
        @name = name
        @value = value
        @checked = checked
      end

      private

      attr_reader :id, :name, :value, :checked

      def template(&content)
        label for: "#{id}_#{value}", class: ITEM_CLASSES do
          input(
            id: "#{id}_#{value}",
            type: :radio,
            name: name,
            hidden: true,
            value: value,
            class: "peer",
            checked: checked
          )
          div class: INDICATOR_CLASSES
          yield_content(&content)
        end
      end
    end
  end
end
