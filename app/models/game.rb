class Game < ActiveRecord::Base

  has_and_belongs_to_many :users
  has_many :wins
  has_many :losses
  has_one :draws
  
end