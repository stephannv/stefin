class AddTransferIdToRecords < ActiveRecord::Migration[7.0]
  def change
    add_reference :records, :transfer, null: true, foreign_key: true, type: :uuid
  end
end
