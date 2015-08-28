class Note < ActiveRecord::Base
  has_many :taggings
  has_many :tags, through: :taggings
  belongs_to :user
  validates :title, presence: true
  validates_uniqueness_of :title

end
