class AlterAccountTitleIndex < ActiveRecord::Migration[7.0]
  def change
    remove_index :accounts, :title
    add_index :accounts, %i[user_id title], unique: true
  end
end
