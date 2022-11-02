module Accounts
  class Update < Actor
    input :id, type: String
    input :attributes, type: Hash

    output :account, type: Account

    def call
      self.account = Account.find(id)

      fail!(error: :invalid_record) unless account.update(attributes)
    end
  end
end
