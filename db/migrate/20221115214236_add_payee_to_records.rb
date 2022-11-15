class AddPayeeToRecords < ActiveRecord::Migration[7.0]
  def change
    add_column :records, :payee, :string, default: ""
  end
end
