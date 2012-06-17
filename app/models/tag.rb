class Tag < ActiveRecord::Base
  attr_accessible :name
  has_many :copipe_tags
  has_many :copipes, :through=> :copipe_tags

end
