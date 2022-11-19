class User < ApplicationRecord
  include Clearance::User

  has_many :accounts, dependent: :destroy
  has_many :categories, dependent: :destroy
end
