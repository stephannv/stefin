class ChangeRecordCategoryIdNull < ActiveRecord::Migration[7.0]
  def change
    change_column_null :records, :category_id, true
  end
end
