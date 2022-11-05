module Categories
  class Destroy < Actor
    input :id, type: String

    output :category, type: Category

    def call
      self.category = Category.find(id)

      fail!(error: :cannot_destroy) unless category.destroy
    end
  end
end
