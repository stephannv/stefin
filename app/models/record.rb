class Record < ApplicationRecord
  has_enumeration_for :group, with: RecordGroups, create_helpers: true, required: true

  belongs_to :account
  belongs_to :category

  validates :account_id, presence: true
  validates :category_id, presence: true
  validates :amount_currency, presence: true
  validates :occurred_on, presence: true

  validates :amount_cents, numericality: {greater_than: 0}

  validates :description, length: {maximum: 50}
end
