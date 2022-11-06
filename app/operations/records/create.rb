module Records
  class Create < Actor
    input :attributes, type: Hash

    output :record, type: Record

    def call
      self.record = Record.new(attributes)
      fail!(error: :invalid_record) unless record.save
    end
  end
end
