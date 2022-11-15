module Records
  class Destroy < Actor
    input :id, type: String

    output :record, type: Record

    def call
      self.record = Record.find(id)

      fail!(error: :cannot_destroy) unless record.destroy
    end
  end
end
