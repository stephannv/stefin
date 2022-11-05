class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories, id: :uuid do |t|
      t.string :title, null: false
      t.string :color, null: false

      t.timestamps
    end

    add_index :categories, :title, unique: true
  end
end
