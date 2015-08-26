class Note < ActiveRecord::Base
  include ActiveModel::Serialization
  has_many :taggings
  has_many :tags, through: :taggings

end
