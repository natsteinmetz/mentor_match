class MainController < ApplicationController
  def index
    @mentors = Mentor.all
    @mentees = Mentee.all
    @mentorships = Mentorship.all
  end
end
