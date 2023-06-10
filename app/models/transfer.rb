class Transfer < ApplicationRecord
  monetize :amount

  belongs_to :from_account, class_name: "Account"
  belongs_to :to_account, class_name: "Account"

  validates :from_account_id, presence: true
  validates :to_account_id, presence: true
  validates :amount_currency, presence: true
  validates :occurred_on, presence: true

  validates :to_account_id, comparison: {
    other_than: :from_account_id,
    message: "must be different from origin account"
  }

  validates :amount_cents, numericality: {greater_than: 0}

  validates :description, length: {maximum: 50}

  def attributes_for_expense_record
    attributes_for_records.merge(group: RecordGroups::EXPENSE, account_id: from_account_id)
  end

  def attributes_for_income_record
    attributes_for_records.merge(group: RecordGroups::INCOME, account_id: to_account_id)
  end

  private

  def attributes_for_records
    {
      transfer_id: id,
      amount_cents: amount_cents,
      amount_currency: amount_currency,
      occurred_on: occurred_on,
      description: description
    }
  end
end
