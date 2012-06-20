
class Copipe < ActiveRecord::Base
  attr_accessible :body, :title
  attr_protected :user_id
  has_many :copipe_tags
  has_many :tags, :through => :copipe_tags
  belongs_to :user
  def anonymous?
    if self.user_id == 0
      return true
    end
    return false
  end
end
