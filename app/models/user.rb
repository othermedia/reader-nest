class User < ActiveRecord::Base
  has_password
  has_many :searches, :dependent => :destroy
  
  validates_length_of :username, :within => 4..60
  validates_uniqueness_of :username
end
