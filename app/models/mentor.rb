class Mentor < ActiveRecord::Base
  has_many :mentorships
  has_many :mentees, :through => mentorships

  attr_accessible :affiliation, :email, :name

  validates :name, :presence => true
  validates :email, :presence => true
end
