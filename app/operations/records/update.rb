module Records
  class Update < Actor
    input :id, type: String
    input :attributes, type: Hash

    output :record, type: Record

    def call
      self.record = Record.find(id)

      ActiveRecord::Base.transaction do
        record.update!(attributes)
        update_accounts_balance if update_account_balance?
      rescue
        fail!(error: :invalid_record)
      end
    end

    private

    def update_accounts_balance
      Accounts::UpdateBalance.call(id: record.account_id)

      if record.account_id_previously_changed?
        Accounts::UpdateBalance.call(id: record.account_id_previously_was)
      end
    end

    def update_account_balance?
      record.amount_cents_previously_changed? ||
        record.group_previously_changed? ||
        record.account_id_previously_changed?
    end
  end
end
