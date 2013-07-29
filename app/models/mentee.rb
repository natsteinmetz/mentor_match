class Mentee < ActiveRecord::Base
  has_many :mentorships
  has_many :mentors, :through => :mentorships

  attr_accessible :email, :goal, :name

  validates :name, :presence => true
  validates :email, :presence => true
end
