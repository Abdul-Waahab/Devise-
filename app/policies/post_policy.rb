class PostPolicy < ApplicationPolicy
  def new?
    user.present?
  end
   
  def create?
    user.present?
  end

  def edit?
    user.present?
  end

  def update?
    user.present? 
  end
   
  def destroy?
    user.present? 
  end
   
  private
   
  def 
    record
  end
end