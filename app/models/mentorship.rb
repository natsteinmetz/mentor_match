class Mentorship < ActiveRecord::Base
  belongs_to :mentor
  belongs_to :mentee

  attr_accessible :kind, :started, :mentor_id, :mentee_id

  validates :mentor, :presence => true
  validates :mentee, :presence => true
end
