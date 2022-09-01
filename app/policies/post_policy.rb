class PostPolicy < ApplicationPolicy

   
  def new?
    user.present?
  end
   
  def edit?
    return true if user.present?
  end

  def update?
    return true if user.present? 
  end
   
  def destroy?
    return true if user.present? 
  end
   
  private
   
  def 
    record
  end
end