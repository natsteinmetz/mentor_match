class MentorshipsController < ApplicationController
  before_filter :find_mentors_and_mentees, only: [:new, :create]

  def new
    if @mentees.size == 0
      flash[:alert] = "There are no mentees to be added to mentorships."
      redirect_to mentees_path
    elsif @mentors.size == 0
      flash[:alert] = "There are no mentors to be added to mentorships."
      redirect_to mentors_path
    else
      @mentorship = Mentorship.new
    end
  end

  def create
    @mentorship = Mentorship.new(params[:mentorship])
    if @mentorship.save
      flash[:notice] = "Mentorship has been created."
      redirect_to @mentorship.mentor
    else
      flash[:alert] = "Mentorship has not been created."
      redirect_to mentors_path
    end
  end

  def destroy
    @mentorship = Mentorship.find(params[:id])
    @mentorship.destroy
    flash[:notice] = "Mentorship has been deleted."
    redirect_to mentors_path
  end

private
  def find_mentors_and_mentees
    @mentors = Mentor.all
    @mentees = Mentee.all
  end
end
