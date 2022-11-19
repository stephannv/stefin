module Records
  class Destroy < Actor
    input :id, type: String

    output :record, type: Record

    def call
      self.record = Record.find(id)

      ActiveRecord::Base.transaction do
        record.destroy!
        Accounts::UpdateBalance.call(id: record.account_id)
      rescue
        fail!(error: :cannot_destroy)
      end
    end
  end
end
