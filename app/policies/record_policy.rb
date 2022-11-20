class RecordPolicy < ApplicationPolicy
  relation_scope do |relation|
    relation.joins(:account).where(accounts: {user_id: user.id})
  end

  def update?
    owner?
  end

  def destroy?
    owner?
  end

  private

  def owner?
    record.account.user_id == user.id
  end
end
