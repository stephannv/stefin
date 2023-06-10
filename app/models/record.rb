class Record < ApplicationRecord
  monetize :amount

  has_enumeration_for :group, with: RecordGroups, create_helpers: true, required: true

  belongs_to :transfer, optional: true
  belongs_to :account
  belongs_to :category, optional: true

  validates :account_id, presence: true
  validates :amount_currency, presence: true
  validates :occurred_on, presence: true

  validates :category, presence: true, unless: :transfer_id?
  validates :category, absence: true, if: :transfer_id?

  validates :amount_cents, numericality: {greater_than: 0}

  validates :payee, length: {maximum: 30}
  validates :description, length: {maximum: 50}

  def transfer?
    transfer_id?
  end
end
