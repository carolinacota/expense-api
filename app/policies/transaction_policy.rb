class TransactionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    !user.nil?
  end

  # def new?
  #   create?
  # end

  def update?
    record.user == @user
  end

  # def edit?
  #   update?
  # end

  def destroy?
    update?
  end
end
