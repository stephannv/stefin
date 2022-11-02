module Accounts
  class Destroy < Actor
    input :id, type: String

    output :account, type: Account

    def call
      self.account = Account.find(id)

      fail!(error: :cannot_destroy) unless account.destroy
    end
  end
end
