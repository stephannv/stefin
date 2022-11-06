module Ds
  module Forms
    class ColorPicker < Ds::Base
      PALETTE = %w[#94a3b8 #334155 #a8a29e #44403c #f87171 #b91c1c #fb923c #ea580c #fcd34d #ca8a04 #bef264 #65a30d #4ade80 #15803d #0d9488 #67e8f9 #0891b2 #60a5fa #1d4ed8 #a78bfa #6d28d9 #e879f9 #a21caf #be185d]
      WRAPPER_CLASSES = "grid grid-cols-6 lg:grid-cols-12 gap-2"
      ITEM_CLASSES = "aspect-square rounded cursor-pointer relative"
      INDICATOR_CLASSES = "hidden peer-checked:block rounded h-full w-full ring-4 ring-offset-1 ring-primary"

      def initialize(id:, name:, selected: nil)
        @id = id
        @name = name
        @selected = selected
      end

      private

      attr_reader :id, :name, :selected

      def template
        div class: WRAPPER_CLASSES do
          PALETTE.each do |color|
            label for: "#{id}_#{color}", class: ITEM_CLASSES, style: "background-color: #{color}" do
              input(
                id: "#{id}_#{color}",
                type: :radio,
                name: name,
                hidden: true,
                value: color,
                class: "peer",
                checked: selected == color
              )
              span class: INDICATOR_CLASSES
            end
          end
        end
      end
    end
  end
end
