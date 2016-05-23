class User < ActiveRecord::Base

  has_secure_password

  has_and_belongs_to_many :games
  has_many :wins
  has_many :losses
  has_many :draws

end