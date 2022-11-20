class AccountPolicy < ApplicationPolicy
  relation_scope do |relation|
    relation.where(user: user)
  end

  def show?
    owner?
  end

  def update?
    owner?
  end

  def destroy?
    owner?
  end
end
