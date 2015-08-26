class Tag < ActiveRecord::Base

  include ActiveModel::Serialization
  has_many :taggings
  has_many :notes, :through => :taggings

end
