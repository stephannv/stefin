module Ds
  class Radio < Ds::Base
    ITEM_CLASSES = "border rounded cursor-pointer text-center p-4 relative hover:shadow transition-all"
    INDICATOR_CLASSES = "absolute top-0 left-0 hidden peer-checked:block rounded h-full w-full ring-2 ring-offset-2 ring-primary"

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
