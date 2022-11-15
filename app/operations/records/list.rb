module Records
  class List < Actor
    output :records, type: Enumerable

    def call
      self.records = Record.order(occurred_on: :desc)
    end
  end
end
