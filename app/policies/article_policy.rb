class ArticlePolicy < ApplicationPolicy
   def permitted_attributes
     [:title, :text, :tags, :banner]
   end

   def update?
     record.author == user
   end

  def destroy?
     record.author == user
   end
 end
