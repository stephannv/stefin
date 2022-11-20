class Category < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :color, presence: true

  validates :title, uniqueness: {scope: :user_id}

  validates :title, length: {maximum: 50}

  validates :color, format: {with: /\A#[a-fA-F0-9]{6}\z/, allow_blank: true}
end
