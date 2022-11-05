module Categories
  class Find < Actor
    input :id, type: String

    output :category, type: Category

    def call
      self.category = Category.find(id)
    end
  end
end
