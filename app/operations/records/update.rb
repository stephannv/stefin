module Records
  class Update < Actor
    input :id, type: String
    input :attributes, type: Hash

    output :record, type: Record

    def call
      self.record = Record.find(id)

      fail!(error: :invalid_record) unless record.update(attributes)
    end
  end
end
