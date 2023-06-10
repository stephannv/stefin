module Transfers
  class Create < Actor
    input :attributes, type: Hash

    output :transfer, type: Transfer

    def call
      self.transfer = Transfer.new(attributes)

      ActiveRecord::Base.transaction do
        transfer.save!
        Records::Create.call(attributes: transfer.attributes_for_expense_record)
        Records::Create.call(attributes: transfer.attributes_for_income_record)
      rescue
        fail!(error: :invalid_record)
      end
    end
  end
end
