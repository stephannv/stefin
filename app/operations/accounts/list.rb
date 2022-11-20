module Accounts
  class List < Actor
    input :scope, type: ActiveRecord::Relation, default: -> { Account.all }

    output :accounts, type: Enumerable

    def call
      self.accounts = scope.order(:created_at)
    end
  end
end
