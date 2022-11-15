class ApplicationRecord < ActiveRecord::Base
  extend Monetizable

  primary_abstract_class
  self.implicit_order_column = :created_at
end
