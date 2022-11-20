module Records
  class List < Actor
    input :scope, type: ActiveRecord::Relation, default: -> { Record.all }

    output :records, type: Enumerable

    def call
      self.records = scope.order(occurred_on: :desc, created_at: :desc)
    end
  end
end
