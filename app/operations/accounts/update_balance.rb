module Accounts
  class UpdateBalance < Actor
    input :id, type: String

    def call
      account = Account.find(id)
      balance_cents = Record.where(account_id: id).sum("records.amount_cents * records.group")

      fail!(error: :invalid_record) unless account.update(balance_cents: balance_cents)
    end
  end
end
