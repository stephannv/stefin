class CreateRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :records, id: :uuid do |t|
      t.references :account, null: false, foreign_key: true, type: :uuid
      t.references :category, null: false, foreign_key: true, type: :uuid
      t.integer :group, null: false
      t.integer :amount_cents, default: 0, null: false
      t.string :amount_currency, default: "BRL", null: false
      t.date :occurred_on, null: false
      t.string :description, default: ""

      t.timestamps
    end
  end
end
