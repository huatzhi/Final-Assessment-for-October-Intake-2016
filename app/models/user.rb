class User < ApplicationRecord
  has_secure_password

  validates_presence_of :password, :on => :create
  validates :email, uniqueness: true, allow_blank: false, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "need legit email" }
  validates_presence_of :username
  validates_uniqueness_of :email


  has_many :ads
end
