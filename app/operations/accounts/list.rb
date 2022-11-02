module Accounts
  class List < Actor
    output :accounts, type: Enumerable

    def call
      self.accounts = Account.order(:created_at)
    end
  end
end
