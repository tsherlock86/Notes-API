class User < ActiveRecord::Base
  include ActiveModel::Serialization
  has_many :notes
  has_many :tags
  before_validation :api_token
  validates :email, presence: true
  validates_uniqueness_of :email


  def api_token
    self.api_token = SecureRandom.urlsafe_base64
  end




end
