class CreateTransfers < ActiveRecord::Migration[7.0]
  def change
    create_table :transfers, id: :uuid do |t|
      t.references :from_account, null: false, foreign_key: { to_table: :accounts }, type: :uuid
      t.references :to_account, null: false, foreign_key: { to_table: :accounts }, type: :uuid
      t.integer :amount_cents, default: 0, null: false
      t.string :amount_currency, default: "BRL", null: false
      t.date :occurred_on, null: false
      t.string :description, default: ""

      t.timestamps
    end
  end
end
