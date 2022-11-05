module Categories
  class List < Actor
    output :categories, type: Enumerable

    def call
      self.categories = Category.order(:created_at)
    end
  end
end
