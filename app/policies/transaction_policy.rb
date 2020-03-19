class TransactionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  # def index?
  #   false
  # end

  def show?
    true
  end

  def create?
    !user.ni
  end

  # def new?
  #   create?
  # end

  def update?
    record.user == user
  end

  # def edit?
  #   update?
  # end

  def destroy?
    update?
  end
end
