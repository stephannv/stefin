module Categories
  class Update < Actor
    input :id, type: String
    input :attributes, type: Hash

    output :category, type: Category

    def call
      self.category = Category.find(id)

      fail!(error: :invalid_record) unless category.update(attributes)
    end
  end
end
