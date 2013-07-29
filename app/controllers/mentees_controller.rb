class MenteesController < ApplicationController
  before_filter :find_mentee, :only => [:show, :edit, :update, :destroy]

  def index
    @mentees = Mentee.all
  end

  def new
    @mentee = Mentee.new
  end

  def create
    @mentee = Mentee.new(params[:mentee])
    if @mentee.save
      flash[:notice] = "Mentee has been created."
      redirect_to @mentee
    else
      flash[:alert] = "Mentee has not been created."
      render :action => "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @mentee.update_attributes(params[:mentee])
      flash[:notice] = "Mentee has been updated."
      redirect_to @mentee
    else
      flash[:alert] = "Mentee has not been updated."
      render :action => "edit"
    end
  end

  def destroy
    @mentee.destroy
    flash[:notice] = "Mentee has been deleted."
    redirect_to mentees_path
  end

private
  def find_mentee
    @mentee = Mentee.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "The mentee you were looking for could not be found."
      redirect_to mentees_path
  end

end
