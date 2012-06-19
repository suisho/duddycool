class CopipeTag < ActiveRecord::Base
  attr_accessible :copipe_id, :tag_id
  belongs_to :copipe
  belongs_to :tag
end
