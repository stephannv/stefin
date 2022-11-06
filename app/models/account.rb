class Account < ApplicationRecord
  has_many :records, dependent: :destroy

  validates :title, presence: true
  validates :balance_cents, presence: true
  validates :balance_currency, presence: true
  validates :color, presence: true

  validates :title, uniqueness: true

  validates :title, length: {maximum: 50}

  validates :color, format: {with: /\A#[a-fA-F0-9]{6}\z/, allow_blank: true}
end
