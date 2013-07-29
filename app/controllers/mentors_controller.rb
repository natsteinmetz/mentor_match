class MentorsController < ApplicationController
before_filter :find_mentor, :only => [:show, :edit, :update, :destroy]

def index
    @mentors = Mentor.all
  end

  def new
    @mentor = Mentor.new
  end

  def create
    @mentor = Mentor.new(params[:mentor])
    if @mentor.save
      flash[:notice] = "Mentor has been created."
      redirect_to @mentor
    else
      flash[:alert] = "Mentor has not been created."
      render :action => "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @mentor.update_attributes(params[:mentor])
      flash[:notice] = "Mentor has been updated."
      redirect_to @mentor
    else
      flash[:alert] = "Mentor has not been updated."
      render :action => "edit"
    end
  end

  def destroy
    @mentor.destroy
    flash[:notice] = "Mentor has been deleted."
    redirect_to mentors_path
  end

private
  def find_mentor
    @mentor = Mentor.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "The mentor you were looking for could not be found."
      redirect_to mentors_path
  end


end
