class FlatPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    return true
  end

  def create?
    return true
  end

  def show?
    return true
  end

  def edit?
    update?
  end

  def update?
    user_is_owner?
  end
  
  def destroy?
    user_is_owner? 
  end
  
  private

  def user_is_owner?
    record.user == user    
  end
end
