
class Copipe < ActiveRecord::Base
  attr_accessible :body, :title, :user_id

  def anonymous?
    if self.user_id == 0
      return true
    end
    return false
  end
end
