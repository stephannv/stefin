class ApplicationPolicy < ActionPolicy::Base
  alias_rule :edit?, to: :update?

  private

  def owner?
    record.user_id == user.id
  end
end
