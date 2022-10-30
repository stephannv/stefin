class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts, id: :uuid do |t|
      t.string :title, null: false
      t.integer :balance_cents, null: false, default: 0
      t.string :balance_currency, null: false, default: "BRL"
      t.string :color, null: false

      t.timestamps
    end

    add_index :accounts, :title, unique: true
  end
end
