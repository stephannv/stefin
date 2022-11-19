class AddUserToAccounts < ActiveRecord::Migration[7.0]
  def change
    add_reference :accounts, :user, null: false, foreign_key: true, type: :uuid
  end
end
