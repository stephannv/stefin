module Records
  class Create < Actor
    input :attributes, type: Hash

    output :record, type: Record

    def call
      self.record = Record.new(attributes)

      ActiveRecord::Base.transaction do
        record.save!
        Accounts::UpdateBalance.call(id: record.account_id)
      rescue
        fail!(error: :invalid_record)
      end
    end
  end
end
