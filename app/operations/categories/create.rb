module Categories
  class Create < Actor
    input :attributes, type: Hash

    output :category, type: Category

    def call
      self.category = Category.new(attributes)

      fail!(error: :invalid_record) unless category.save
    end
  end
end
