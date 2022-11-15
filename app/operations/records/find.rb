module Records
  class Find < Actor
    input :id, type: String

    output :record, type: Record

    def call
      self.record = Record.find(id)
    end
  end
end
