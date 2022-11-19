module Records
  class List < Actor
    output :records, type: Enumerable

    def call
      self.records = Record.order(occurred_on: :desc, created_at: :desc)
    end
  end
end
