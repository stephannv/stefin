module Accounts
  class Find < Actor
    input :id, type: String

    output :account, type: Account

    def call
      self.account = Account.find(id)
    end
  end
end
