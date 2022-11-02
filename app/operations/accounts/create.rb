module Accounts
  class Create < Actor
    input :attributes, type: Hash

    output :account, type: Account

    def call
      self.account = Account.new(attributes)

      fail!(error: :invalid_record) unless account.save
    end
  end
end
