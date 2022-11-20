class AlterCategoryTitleIndex < ActiveRecord::Migration[7.0]
  def change
    remove_index :categories, :title
    add_index :categories, %i[user_id title], unique: true
  end
end
