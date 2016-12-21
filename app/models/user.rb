class User < ApplicationRecord
  has_secure_password

  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_presence_of :username
  validates_uniqueness_of :email

  has_many :ads
end
